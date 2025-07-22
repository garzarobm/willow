<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * PageViews Model
 *
 * Tracks page views for both Articles and Products using polymorphic associations.
 * This table now supports tracking views for multiple content types.
 *
 * @property \Cake\ORM\Association\BelongsTo $Articles
 * @property \Cake\ORM\Association\BelongsTo $Products
 * @method \App\Model\Entity\PageView newEmptyEntity()
 * @method \App\Model\Entity\PageView newEntity(array $data, array $options = [])
 * @method array<\App\Model\Entity\PageView> newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\PageView get(mixed $primaryKey, array|string $finder = 'all', \Psr\SimpleCache\CacheInterface|string|null $cache = null, \Closure|string|null $cacheKey = null, mixed ...$args)
 * @method \App\Model\Entity\PageView findOrCreate($search, ?callable $callback = null, array $options = [])
 * @method \App\Model\Entity\PageView patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method array<\App\Model\Entity\PageView> patchEntities(iterable $entities, array $data, array $options = [])
 * @method \App\Model\Entity\PageView|false save(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method \App\Model\Entity\PageView saveOrFail(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @mixin \Cake\ORM\Behavior\TimestampBehavior
 */
class PageViewsTable extends Table
{
    /**
     * Initialize method
     *
     * @param array<string, mixed> $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config): void
    {
        parent::initialize($config);
        
        $this->setTable('page_views');
        $this->setDisplayField('ip_address');
        $this->setPrimaryKey('id');
        
        $this->addBehavior('Timestamp');
        
        // Polymorphic associations for both Articles and Products
        
        // Articles association (backward compatibility)
        $this->belongsTo('Articles', [
            'foreignKey' => 'article_id',
            'joinType' => 'LEFT', // Changed to LEFT for optional relationship
            'conditions' => function ($exp, $query) {
                return $exp->or([
                    'PageViews.model IS' => null, // Legacy records
                    'PageViews.model' => 'Articles'
                ]);
            }
        ]);
        
        // Products association (new functionality)
        $this->belongsTo('Products', [
            'foreignKey' => 'foreign_key',
            'bindingKey' => 'id',
            'joinType' => 'LEFT',
            'conditions' => ['PageViews.model' => 'Products']
        ]);
        
        // Polymorphic Articles association using new structure
        $this->belongsTo('PolymorphicArticles', [
            'className' => 'Articles',
            'foreignKey' => 'foreign_key',
            'bindingKey' => 'id', 
            'joinType' => 'LEFT',
            'conditions' => ['PageViews.model' => 'Articles']
        ]);

        // CounterCache behavior for both content types
        $this->addBehavior('CounterCache', [
            'Articles' => [
                'view_count',
                'conditions' => [
                    'OR' => [
                        ['PageViews.model IS' => null], // Legacy records
                        ['PageViews.model' => 'Articles']
                    ]
                ]
            ],
            'Products' => [
                'view_count',
                'conditions' => ['PageViews.model' => 'Products']
            ]
        ]);
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator): Validator
    {
        // Legacy article_id validation (for backward compatibility)
        $validator
            ->uuid('article_id')
            ->allowEmptyString('article_id');

        // New polymorphic validation
        $validator
            ->scalar('model')
            ->maxLength('model', 20)
            ->allowEmptyString('model')
            ->add('model', 'validModel', [
                'rule' => function ($value) {
                    return in_array($value, ['Articles', 'Products']) || empty($value);
                },
                'message' => __('Model must be either Articles or Products')
            ]);

        $validator
            ->uuid('foreign_key')
            ->allowEmptyString('foreign_key')
            ->add('foreign_key', 'requireWhenModelPresent', [
                'rule' => function ($value, $context) {
                    return empty($context['data']['model']) || !empty($value);
                },
                'message' => __('Foreign key is required when model is specified')
            ]);

        // Ensure either legacy article_id or new polymorphic structure is used
        $validator
            ->add('article_id', 'requireEitherArticleIdOrPolymorphic', [
                'rule' => function ($value, $context) {
                    $hasLegacy = !empty($context['data']['article_id']);
                    $hasNew = !empty($context['data']['model']) && !empty($context['data']['foreign_key']);
                    return $hasLegacy || $hasNew;
                },
                'message' => __('Either article_id or model/foreign_key combination is required')
            ]);

        $validator
            ->scalar('ip_address')
            ->maxLength('ip_address', 45)
            ->requirePresence('ip_address', 'create')
            ->notEmptyString('ip_address');

        $validator
            ->scalar('user_agent')
            ->allowEmptyString('user_agent');

        $validator
            ->scalar('referer')
            ->allowEmptyString('referer');

        return $validator;
    }

    /**
     * Returns a rules checker object that will be used for validating
     * application integrity.
     *
     * @param \Cake\ORM\RulesChecker $rules The rules object to be modified.
     * @return \Cake\ORM\RulesChecker
     */
    public function buildRules(RulesChecker $rules): RulesChecker
    {
        // Legacy article validation (backward compatibility)
        $rules->add($rules->existsIn(['article_id'], 'Articles'), [
            'errorField' => 'article_id',
            'on' => function ($entity, $options) {
                return !empty($entity->article_id);
            }
        ]);
        
        // Polymorphic validation for Articles
        $rules->add($rules->existsIn(['foreign_key'], 'PolymorphicArticles'), [
            'errorField' => 'foreign_key',
            'message' => __('The specified article does not exist'),
            'on' => function ($entity, $options) {
                return $entity->model === 'Articles';
            }
        ]);
        
        // Polymorphic validation for Products  
        $rules->add($rules->existsIn(['foreign_key'], 'Products'), [
            'errorField' => 'foreign_key',
            'message' => __('The specified product does not exist'),
            'on' => function ($entity, $options) {
                return $entity->model === 'Products';
            }
        ]);

        return $rules;
    }

    /**
     * Create a page view record for an article
     *
     * @param string $articleId Article UUID
     * @param string $ipAddress Visitor's IP address
     * @param string|null $userAgent User agent string
     * @param string|null $referer Referer URL
     * @return \App\Model\Entity\PageView|false
     */
    public function recordArticleView(string $articleId, string $ipAddress, ?string $userAgent = null, ?string $referer = null)
    {
        $pageView = $this->newEntity([
            'model' => 'Articles',
            'foreign_key' => $articleId,
            'article_id' => $articleId, // Keep for backward compatibility
            'ip_address' => $ipAddress,
            'user_agent' => $userAgent,
            'referer' => $referer
        ]);

        return $this->save($pageView);
    }

    /**
     * Create a page view record for a product
     *
     * @param string $productId Product UUID
     * @param string $ipAddress Visitor's IP address  
     * @param string|null $userAgent User agent string
     * @param string|null $referer Referer URL
     * @return \App\Model\Entity\PageView|false
     */
    public function recordProductView(string $productId, string $ipAddress, ?string $userAgent = null, ?string $referer = null)
    {
        $pageView = $this->newEntity([
            'model' => 'Products', 
            'foreign_key' => $productId,
            'ip_address' => $ipAddress,
            'user_agent' => $userAgent,
            'referer' => $referer
        ]);

        return $this->save($pageView);
    }

    /**
     * Get view statistics for a specific content item
     *
     * @param string $model Model name (Articles or Products)
     * @param string $foreignKey Record ID
     * @return array<string, mixed> View statistics
     */
    public function getViewStats(string $model, string $foreignKey): array
    {
        $conditions = [
            'model' => $model,
            'foreign_key' => $foreignKey
        ];

        // Handle legacy article records
        if ($model === 'Articles') {
            $conditions = [
                'OR' => [
                    ['model' => 'Articles', 'foreign_key' => $foreignKey],
                    ['model IS' => null, 'article_id' => $foreignKey]
                ]
            ];
        }

        return [
            'total_views' => $this->find()->where($conditions)->count(),
            'unique_ips' => $this->find()
                ->where($conditions)
                ->select(['ip_address'])
                ->distinct(['ip_address'])
                ->count(),
            'recent_views' => $this->find()
                ->where($conditions)
                ->where(['created >=' => date('Y-m-d H:i:s', strtotime('-30 days'))])
                ->count()
        ];
    }
}
