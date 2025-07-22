<?php
declare(strict_types=1);

namespace App\Model\Table;

use App\Utility\SettingsManager;
use ArrayObject;
use Cake\Datasource\EntityInterface;
use Cake\Event\EventInterface;
use Cake\Log\LogTrait;
use Cake\ORM\Behavior\Translate\TranslateTrait;
use Cake\ORM\Query\SelectQuery;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Products Model
 *
 * @property \App\Model\Table\UsersTable&\Cake\ORM\Association\BelongsTo $Users
 * @property \App\Model\Table\TagsTable&\Cake\ORM\Association\BelongsToMany $Tags
 * @method \App\Model\Entity\Product newEmptyEntity()
 * @method \App\Model\Entity\Product newEntity(array $data, array $options = [])
 * @method array<\App\Model\Entity\Product> newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Product get(mixed $primaryKey, array|string $finder = 'all', \Psr\SimpleCache\CacheInterface|string|null $cache = null, \Closure|string|null $cacheKey = null, mixed ...$args)
 * @method \App\Model\Entity\Product findOrCreate($search, ?callable $callback = null, array $options = [])
 * @method \App\Model\Entity\Product patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method array<\App\Model\Entity\Product> patchEntities(iterable $entities, array $data, array $options = [])
 * @method \App\Model\Entity\Product|false save(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method \App\Model\Entity\Product saveOrFail(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @mixin \Cake\ORM\Behavior\TimestampBehavior
 */
class ProductsTable extends Table
{
    use LogTrait;
    use QueueableJobsTrait;
    use SeoFieldsTrait;
    use TranslateTrait;

    /**
     * Initialize method
     *
     * @param array<string, mixed> $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('products');
        $this->setDisplayField('title');
        $this->setPrimaryKey('id');

        // // Add timestamp behavior for created/modified fields
        // $this->addBehavior('Timestamp');

        // // Add hierarchical behavior for product categories
        // $this->addBehavior('Orderable', [
        //     'displayField' => 'title',
        // ]);

        // // Add slug behavior for SEO-friendly URLs
        // $this->addBehavior('Slug', [
        //     'sourceField' => 'title',
        //     'targetField' => 'slug',
        //     'maxLength' => 255,
        // ]);

        // // Add translation behavior for multi-language support
        // $this->addBehavior('Translate', [
        //     'fields' => [
        //         'title',
        //         'lede', 
        //         'body',
        //         'summary',
        //         'meta_title',
        //         'meta_description',
        //         'meta_keywords',
        //         'facebook_description',
        //         'linkedin_description',
        //         'twitter_description',
        //         'instagram_description',
        //         'alt_text',
        //         'keywords'
        //     ],
        //     'defaultLocale' => 'en_GB',
        //     'allowEmptyTranslations' => false,
        // ]);

        // // Add image association behavior
        // $this->addBehavior('ImageAssociable');

        // // Add commentable behavior for product reviews/comments
        // $this->addBehavior('Commentable');

        // // Add image upload behavior with queue processing
        // $this->addBehavior('QueueableImage', [
        //     'folder_path' => 'files/Products/image/',
        //     'field' => 'image',
        // ]);

        // // Define associations
        // $this->belongsTo('Users', [
        //     'foreignKey' => 'user_id',
        //     'joinType' => 'INNER',
        // ]);

        // $this->belongsTo('ParentProduct', [
        //     'className' => 'Products',
        //     'foreignKey' => 'parent_id',
        // ]);

        // $this->hasMany('ChildProducts', [
        //     'className' => 'Products',
        //     'foreignKey' => 'parent_id',
        // ]);

        // $this->belongsToMany('Tags', [
        //     'foreignKey' => 'product_id',
        //     'targetForeignKey' => 'tag_id',
        //     'joinTable' => 'products_tags',
        // ]);

        $this->addBehavior('Commentable');

        $this->addBehavior('Orderable', [
            'displayField' => 'title',
        ]);

        $this->addBehavior('Slug');

        $this->addBehavior('ImageAssociable');

        $this->addBehavior('QueueableImage', [
            'folder_path' => 'files/Products/image/',
            'field' => 'image',
        ]);

        $this->addBehavior('Translate', [
            'fields' => [
                'title',
                'body',
                'summary',
                'meta_title',
                'meta_description',
                'meta_keywords',
                'facebook_description',
                'linkedin_description',
                'instagram_description',
                'twitter_description',
            ],
            'defaultLocale' => 'en_GB',
            'allowEmptyTranslations' => false,
        ]);

        $this->belongsTo('Users', [
            'foreignKey' => 'user_id',
            'joinType' => 'LEFT',
        ]);
        $this->belongsToMany('Tags', [
            'foreignKey' => 'product_id',
            'targetForeignKey' => 'tag_id',
            'joinTable' => 'products_tags',
        ]);

        $this->hasMany('PageViews', [
            'foreignKey' => 'product_id',
            'dependent' => true,
            'cascadeCallbacks' => true,
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
        $validator
            ->uuid('id')
            ->allowEmptyString('id', null, 'create');

        $validator
            ->scalar('title')
            ->maxLength('title', 255)
            ->requirePresence('title', 'create')
            ->notEmptyString('title');

        $validator
            ->scalar('lede')
            ->allowEmptyString('lede');

        $validator
            ->boolean('featured')
            ->notEmptyString('featured');

        $validator
            ->boolean('main_menu')
            ->notEmptyString('main_menu');

        $validator
            ->scalar('slug')
            ->maxLength('slug', 255)
            ->allowEmptyString('slug');

        $validator
            ->scalar('body')
            ->allowEmptyString('body');

        $validator
            ->scalar('summary')
            ->allowEmptyString('summary');

        $validator
            ->scalar('kind')
            ->maxLength('kind', 50)
            ->notEmptyString('kind');

        $validator
            ->boolean('published')
            ->notEmptyString('published');

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
        $rules->add($rules->existsIn('user_id', 'Users'), ['errorField' => 'user_id']);
        $rules->add($rules->existsIn('parent_id', 'ParentProduct'), ['errorField' => 'parent_id']);
        $rules->add($rules->isUnique(['slug']), ['errorField' => 'slug']);

        return $rules;
    }

    /**
     * After save callback for AI processing and translations
     *
     * @param \Cake\Event\EventInterface $event The afterSave event
     * @param \Cake\Datasource\EntityInterface $entity The product entity
     * @param \ArrayObject $options Save options
     * @return void
     */
    public function afterSave(EventInterface $event, EntityInterface $entity, ArrayObject $options): void
    {
        $noMessage = $options['noMessage'] ?? false;
        
        if (SettingsManager::read('AI.enabled') && !$noMessage) {
            $data = [
                'id' => $entity->id,
                'title' => $entity->title,
                'body' => $entity->body ?? '',
            ];

            // Queue SEO update job
            if (SettingsManager::read('AI.productSEO') && !empty($this->emptySeoFields($entity))) {
                $this->queueJob('App\Job\ProductSeoUpdateJob', $data);
            }

            // Queue tag generation job
            if (SettingsManager::read('AI.productTags')) {
                $this->queueJob('App\Job\ProductTagUpdateJob', $data);
            }

            // Queue summary generation job
            if (SettingsManager::read('AI.productSummary')) {
                $this->queueJob('App\Job\ProductSummaryUpdateJob', $data);
            }

            // Queue translation job
            if (SettingsManager::read('AI.productTranslations')) {
                $this->queueJob('App\Job\TranslateProductJob', $data);
            }
        }
    }

    /**
     * Find published products
     *
     * @param \Cake\ORM\Query\SelectQuery $query Query object
     * @param array $options Query options
     * @return \Cake\ORM\Query\SelectQuery
     */
    public function findPublished(SelectQuery $query, array $options): SelectQuery
    {
        return $query->where(['Products.published' => true]);
    }

    /**
     * Find featured products
     *
     * @param \Cake\ORM\Query\SelectQuery $query Query object
     * @param array $options Query options
     * @return \Cake\ORM\Query\SelectQuery
     */
    public function findFeatured(SelectQuery $query, array $options): SelectQuery
    {
        return $query->where(['Products.featured' => true]);
    }

    /**
     * Get all SEO fields for Products table
     *
     * @return array<string> List of all SEO field names
     */
    protected function getAllSeoFields(): array
    {
        return array_merge(['lede'], $this->getStandardSeoFields());
    }
}
