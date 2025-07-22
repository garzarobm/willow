<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * ProductsTranslations Model
 *
 * @method \App\Model\Entity\ProductsTranslation newEmptyEntity()
 * @method \App\Model\Entity\ProductsTranslation newEntity(array $data, array $options = [])
 * @method array<\App\Model\Entity\ProductsTranslation> newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\ProductsTranslation get(mixed $primaryKey, array|string $finder = 'all', \Psr\SimpleCache\CacheInterface|string|null $cache = null, \Closure|string|null $cacheKey = null, mixed ...$args)
 * @method \App\Model\Entity\ProductsTranslation findOrCreate($search, ?callable $callback = null, array $options = [])
 * @method \App\Model\Entity\ProductsTranslation patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method array<\App\Model\Entity\ProductsTranslation> patchEntities(iterable $entities, array $data, array $options = [])
 * @method \App\Model\Entity\ProductsTranslation|false save(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method \App\Model\Entity\ProductsTranslation saveOrFail(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method iterable<\App\Model\Entity\ProductsTranslation>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\ProductsTranslation>|false saveMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\ProductsTranslation>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\ProductsTranslation> saveManyOrFail(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\ProductsTranslation>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\ProductsTranslation>|false deleteMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\ProductsTranslation>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\ProductsTranslation> deleteManyOrFail(iterable $entities, array $options = [])
 */
class ProductsTranslationsTable extends Table
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

        $this->setTable('products_translations');
        $this->setDisplayField('title');
        $this->setPrimaryKey(['id', 'locale']);
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
            ->scalar('title')
            ->maxLength('title', 255)
            ->allowEmptyString('title');

        $validator
            ->scalar('body')
            ->allowEmptyString('body');

        $validator
            ->scalar('summary')
            ->allowEmptyString('summary');

        return $validator;
    }
}
