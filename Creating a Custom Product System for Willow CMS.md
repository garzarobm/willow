<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Creating a Custom Product System for Willow CMS

This comprehensive guide demonstrates how to create a complete product system that mirrors the existing articles structure in Willow CMS, ensuring full compatibility with the CakePHP 5.2 framework and the existing application architecture.

## Overview of Existing Articles Structure

Based on the Willow CMS codebase, the articles system employs a sophisticated architecture that we'll replicate for products:

- **Main Entity**: Articles table with SEO fields, translation support, and hierarchical structure
- **Translation Support**: ArticlesTranslation table using CakePHP's Translate behavior
- **Tagging System**: Many-to-many relationship via ArticlesTags junction table
- **Behaviors**: Slug, Translate, ImageAssociable, Commentable, and QueueableImage behaviors
- **Admin Integration**: Full CRUD interface with AdminTheme plugin

The products system will implement identical functionality with `kind='Products'` instead of articles, maintaining consistency across the application.

## Database Migration Files

### Step 1: Main Products Table Migration

Create the primary products migration file following CakePHP 5.2 conventions:

**File**: `config/Migrations/YYYYMMDDHHMMSS_CreateProducts.php`

```php
<?php
declare(strict_types=1);

use Migrations\AbstractMigration;

/**
 * CreateProducts Migration
 * 
 * This migration creates the main products table that mirrors the articles structure
 * but is specifically designed for product management. It includes all necessary
 * fields for SEO, hierarchical organization, and AI-powered content management.
 */
class CreateProducts extends AbstractMigration
{
    /**
     * Change Method.
     *
     * Creates the products table with all necessary fields, indexes, and constraints
     * to support the full product management system including:
     * - Basic product information (title, description, etc.)
     * - SEO meta fields for search engine optimization
     * - Hierarchical structure using nested set model (lft, rght, parent_id)
     * - AI-powered content fields (summary, meta descriptions)
     * - Image association support
     * - Publishing and featured status management
     * - Full translation support preparation
     *
     * @return void
     */
    public function change(): void
    {
        // Create the main products table
        $table = $this->table('products', [
            'id' => false,
            'primary_key' => ['id'],
            'engine' => 'InnoDB',
            'encoding' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'comment' => 'Main products table for CMS product management system'
        ]);

        // Primary key - using CHAR(36) for UUID compatibility like articles
        $table->addColumn('id', 'char', [
            'limit' => 36,
            'null' => false,
            'comment' => 'Primary key - UUID format for distributed system compatibility'
        ]);

        // User relationship - references users.id for product ownership
        $table->addColumn('user_id', 'char', [
            'limit' => 36,
            'null' => false,
            'comment' => 'Foreign key to users table - product creator/owner'
        ]);

        // Basic product information fields
        $table->addColumn('title', 'string', [
            'limit' => 255,
            'null' => false,
            'comment' => 'Product title - main heading for SEO and display'
        ]);

        $table->addColumn('lede', 'text', [
            'null' => true,
            'comment' => 'Product short description/summary for listings and previews'
        ]);

        // Product status and visibility controls
        $table->addColumn('featured', 'boolean', [
            'default' => false,
            'null' => false,
            'comment' => 'Featured status for homepage/special promotions display'
        ]);

        $table->addColumn('main_menu', 'boolean', [
            'default' => false,
            'null' => false,
            'comment' => 'Show in main navigation menu'
        ]);

        // URL-friendly slug for SEO optimization
        $table->addColumn('slug', 'string', [
            'limit' => 255,
            'null' => true,
            'comment' => 'URL-friendly identifier for SEO and clean URLs'
        ]);

        // Main content fields
        $table->addColumn('body', 'text', [
            'null' => true,
            'comment' => 'Main product description/content - supports HTML and rich text'
        ]);

        $table->addColumn('markdown', 'text', [
            'null' => true,
            'comment' => 'Markdown format of product content for editors'
        ]);

        // AI-generated summary field for automatic content enhancement
        $table->addColumn('summary', 'text', [
            'null' => true,
            'comment' => 'AI-generated product summary for improved SEO and user experience'
        ]);

        // SEO meta fields for search engine optimization
        $table->addColumn('meta_title', 'string', [
            'limit' => 255,
            'null' => true,
            'comment' => 'SEO meta title - appears in search results and browser tabs'
        ]);

        $table->addColumn('meta_description', 'text', [
            'null' => true,
            'comment' => 'SEO meta description - appears in search engine results'
        ]);

        $table->addColumn('meta_keywords', 'text', [
            'null' => true,
            'comment' => 'SEO keywords for search engine indexing'
        ]);

        // Social media meta fields for rich sharing
        $table->addColumn('facebook_description', 'text', [
            'null' => true,
            'comment' => 'Facebook-specific description for Open Graph sharing'
        ]);

        $table->addColumn('linkedin_description', 'text', [
            'null' => true,
            'comment' => 'LinkedIn-specific description for professional sharing'
        ]);

        $table->addColumn('twitter_description', 'text', [
            'null' => true,
            'comment' => 'Twitter-specific description for Twitter Card sharing'
        ]);

        $table->addColumn('instagram_description', 'text', [
            'null' => true,
            'comment' => 'Instagram-specific description for social sharing'
        ]);

        // Content analytics field
        $table->addColumn('word_count', 'integer', [
            'null' => true,
            'comment' => 'Automatic word count for content analytics and reading time calculation'
        ]);

        // Product type classification - using 'Products' to distinguish from articles
        $table->addColumn('kind', 'string', [
            'limit' => 50,
            'null' => false,
            'default' => 'Products',
            'comment' => 'Content type identifier - always "Products" for this table'
        ]);

        // Hierarchical structure fields for nested set model (same as articles)
        $table->addColumn('parent_id', 'char', [
            'limit' => 36,
            'null' => true,
            'comment' => 'Parent product ID for hierarchical organization'
        ]);

        $table->addColumn('lft', 'integer', [
            'null' => true,
            'comment' => 'Left value for nested set model - enables efficient tree queries'
        ]);

        $table->addColumn('rght', 'integer', [
            'null' => true,
            'comment' => 'Right value for nested set model - enables efficient tree queries'
        ]);

        // Publishing status control
        $table->addColumn('published', 'boolean', [
            'default' => false,
            'null' => false,
            'comment' => 'Publication status - controls public visibility'
        ]);

        // Computed published status (virtual field support)
        $table->addColumn('is_published', 'boolean', [
            'default' => false,
            'null' => false,
            'comment' => 'Computed publication status including additional business logic'
        ]);

        // Product view count for analytics
        $table->addColumn('view_count', 'integer', [
            'default' => 0,
            'null' => false,
            'comment' => 'Number of page views for analytics and popularity tracking'
        ]);

        // Image association fields (compatible with QueueableImageBehavior)
        $table->addColumn('image', 'string', [
            'limit' => 255,
            'null' => true,
            'comment' => 'Main product image filename for QueueableImageBehavior'
        ]);

        $table->addColumn('dir', 'string', [
            'limit' => 255,
            'null' => true,
            'comment' => 'Image directory path for Upload behavior'
        ]);

        $table->addColumn('alt_text', 'string', [
            'limit' => 255,
            'null' => true,
            'comment' => 'Image alt text for accessibility and SEO'
        ]);

        $table->addColumn('keywords', 'text', [
            'null' => true,
            'comment' => 'AI-generated image keywords for better categorization'
        ]);

        $table->addColumn('size', 'integer', [
            'null' => true,
            'comment' => 'Image file size in bytes'
        ]);

        $table->addColumn('mime', 'string', [
            'limit' => 100,
            'null' => true,
            'comment' => 'Image MIME type for proper handling'
        ]);

        // Timestamp fields for audit trail
        $table->addColumn('created', 'datetime', [
            'null' => true,
            'comment' => 'Record creation timestamp'
        ]);

        $table->addColumn('modified', 'datetime', [
            'null' => true,
            'comment' => 'Last modification timestamp'
        ]);

        // Create all necessary indexes for optimal performance
        
        // Primary key constraint
        $table->addPrimaryKey(['id'], [
            'name' => 'PRIMARY',
            'comment' => 'Primary key constraint on UUID'
        ]);

        // Foreign key index for user relationship
        $table->addIndex(['user_id'], [
            'name' => 'idx_products_user_id',
            'comment' => 'Index for user relationship queries'
        ]);

        // Unique slug index for URL routing (same as articles)
        $table->addIndex(['slug'], [
            'name' => 'idx_products_slug',
            'unique' => true,
            'comment' => 'Unique index for SEO-friendly URLs'
        ]);

        // Publishing status index for public queries
        $table->addIndex(['published'], [
            'name' => 'idx_products_published',
            'comment' => 'Index for published content queries'
        ]);

        // Featured products index for homepage queries
        $table->addIndex(['featured'], [
            'name' => 'idx_products_featured',
            'comment' => 'Index for featured product queries'
        ]);

        // Hierarchical structure indexes for tree operations
        $table->addIndex(['parent_id'], [
            'name' => 'idx_products_parent_id',
            'comment' => 'Index for parent-child relationship queries'
        ]);

        $table->addIndex(['lft', 'rght'], [
            'name' => 'idx_products_tree',
            'comment' => 'Composite index for nested set model tree operations'
        ]);

        // Content type index for mixed content queries
        $table->addIndex(['kind'], [
            'name' => 'idx_products_kind',
            'comment' => 'Index for content type filtering'
        ]);

        // Timestamp indexes for chronological queries
        $table->addIndex(['created'], [
            'name' => 'idx_products_created',
            'comment' => 'Index for chronological sorting and date range queries'
        ]);

        $table->addIndex(['modified'], [
            'name' => 'idx_products_modified',
            'comment' => 'Index for last modified queries'
        ]);

        // Composite index for published products by creation date
        $table->addIndex(['published', 'created'], [
            'name' => 'idx_products_published_created',
            'comment' => 'Composite index for published product listings ordered by date'
        ]);

        // Composite index for featured published products
        $table->addIndex(['featured', 'published'], [
            'name' => 'idx_products_featured_published',
            'comment' => 'Composite index for featured published product queries'
        ]);

        // Create the table with all defined columns and indexes
        $table->create();

        // Add foreign key constraints for data integrity
        $this->table('products')
            ->addForeignKey('user_id', 'users', 'id', [
                'delete' => 'RESTRICT',
                'update' => 'CASCADE',
                'name' => 'fk_products_user_id',
                'comment' => 'Foreign key constraint to users table'
            ])
            ->addForeignKey('parent_id', 'products', 'id', [
                'delete' => 'CASCADE',
                'update' => 'CASCADE',
                'name' => 'fk_products_parent_id',
                'comment' => 'Self-referencing foreign key for hierarchical structure'
            ])
            ->update();
    }
}
```


### Step 2: Products-Tags Junction Table Migration

**File**: `config/Migrations/YYYYMMDDHHMMSS_CreateProductsTags.php`

```php
<?php
declare(strict_types=1);

use Migrations\AbstractMigration;

/**
 * CreateProductsTags Migration
 * 
 * Creates the junction table for many-to-many relationship between products and tags.
 * This mirrors the articles_tags structure and enables flexible product categorization
 * and tagging for improved organization and discoverability.
 */
class CreateProductsTags extends AbstractMigration
{
    /**
     * Change Method.
     *
     * Creates the products_tags junction table with proper indexes and constraints
     * for optimal performance in many-to-many queries between products and tags.
     *
     * @return void
     */
    public function change(): void
    {
        // Create junction table for products-tags many-to-many relationship
        $table = $this->table('products_tags', [
            'id' => false,
            'primary_key' => ['product_id', 'tag_id'],
            'engine' => 'InnoDB',
            'encoding' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'comment' => 'Junction table for products and tags many-to-many relationship'
        ]);

        // Product foreign key - references products.id
        $table->addColumn('product_id', 'char', [
            'limit' => 36,
            'null' => false,
            'comment' => 'Foreign key to products table'
        ]);

        // Tag foreign key - references tags.id
        $table->addColumn('tag_id', 'char', [
            'limit' => 36,
            'null' => false,
            'comment' => 'Foreign key to tags table'
        ]);

        // Composite primary key on both foreign keys
        $table->addPrimaryKey(['product_id', 'tag_id'], [
            'name' => 'PRIMARY',
            'comment' => 'Composite primary key preventing duplicate associations'
        ]);

        // Individual indexes for efficient querying
        $table->addIndex(['product_id'], [
            'name' => 'idx_products_tags_product_id',
            'comment' => 'Index for finding tags by product'
        ]);

        $table->addIndex(['tag_id'], [
            'name' => 'idx_products_tags_tag_id', 
            'comment' => 'Index for finding products by tag'
        ]);

        // Create the table
        $table->create();

        // Add foreign key constraints
        $this->table('products_tags')
            ->addForeignKey('product_id', 'products', 'id', [
                'delete' => 'CASCADE',
                'update' => 'CASCADE',
                'name' => 'fk_products_tags_product_id',
                'comment' => 'Cascade delete when product is removed'
            ])
            ->addForeignKey('tag_id', 'tags', 'id', [
                'delete' => 'CASCADE', 
                'update' => 'CASCADE',
                'name' => 'fk_products_tags_tag_id',
                'comment' => 'Cascade delete when tag is removed'
            ])
            ->update();
    }
}
```


### Step 3: Products Translation Table Migration

**File**: `config/Migrations/YYYYMMDDHHMMSS_CreateProductsTranslations.php`

```php
<?php
declare(strict_types=1);

use Migrations\AbstractMigration;

/**
 * CreateProductsTranslations Migration
 * 
 * Creates the translation table for products using CakePHP's ShadowTableStrategy.
 * This enables full internationalization support with AI-powered translation
 * capabilities for all product content and metadata.
 */
class CreateProductsTranslations extends AbstractMigration
{
    /**
     * Change Method.
     *
     * Creates the products_translations table for multi-language support
     * following CakePHP's Translate behavior ShadowTableStrategy pattern.
     *
     * @return void
     */
    public function change(): void
    {
        // Create translation table using ShadowTableStrategy pattern
        $table = $this->table('products_translations', [
            'id' => false,
            'primary_key' => ['id', 'locale'],
            'engine' => 'InnoDB',
            'encoding' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'comment' => 'Translation table for products multi-language support'
        ]);

        // Foreign key to main products table
        $table->addColumn('id', 'char', [
            'limit' => 36,
            'null' => false,
            'comment' => 'Foreign key to products.id'
        ]);

        // Locale identifier for translation
        $table->addColumn('locale', 'string', [
            'limit' => 5,
            'null' => false,
            'comment' => 'Locale code (e.g., en_US, es_ES, fr_FR) for translation'
        ]);

        // Translatable content fields - main product information
        $table->addColumn('title', 'string', [
            'limit' => 255,
            'null' => true,
            'comment' => 'Translated product title'
        ]);

        $table->addColumn('lede', 'text', [
            'null' => true,
            'comment' => 'Translated product short description'
        ]);

        $table->addColumn('body', 'text', [
            'null' => true,
            'comment' => 'Translated main product content'
        ]);

        $table->addColumn('summary', 'text', [
            'null' => true,
            'comment' => 'Translated AI-generated summary'
        ]);

        // Translatable SEO meta fields
        $table->addColumn('meta_title', 'string', [
            'limit' => 255,
            'null' => true,
            'comment' => 'Translated SEO meta title'
        ]);

        $table->addColumn('meta_description', 'text', [
            'null' => true,
            'comment' => 'Translated SEO meta description'
        ]);

        $table->addColumn('meta_keywords', 'text', [
            'null' => true,
            'comment' => 'Translated SEO keywords'
        ]);

        // Translatable social media descriptions
        $table->addColumn('facebook_description', 'text', [
            'null' => true,
            'comment' => 'Translated Facebook sharing description'
        ]);

        $table->addColumn('linkedin_description', 'text', [
            'null' => true,
            'comment' => 'Translated LinkedIn sharing description'
        ]);

        $table->addColumn('twitter_description', 'text', [
            'null' => true,
            'comment' => 'Translated Twitter sharing description'
        ]);

        $table->addColumn('instagram_description', 'text', [
            'null' => true,
            'comment' => 'Translated Instagram sharing description'
        ]);

        // Translatable image fields
        $table->addColumn('alt_text', 'string', [
            'limit' => 255,
            'null' => true,
            'comment' => 'Translated image alt text for accessibility'
        ]);

        $table->addColumn('keywords', 'text', [
            'null' => true,
            'comment' => 'Translated image keywords'
        ]);

        // Composite primary key for translation records
        $table->addPrimaryKey(['id', 'locale'], [
            'name' => 'PRIMARY',
            'comment' => 'Composite primary key on product ID and locale'
        ]);

        // Index for locale-specific queries
        $table->addIndex(['locale'], [
            'name' => 'idx_products_translations_locale',
            'comment' => 'Index for locale-specific translation queries'
        ]);

        // Index for product-specific translation queries
        $table->addIndex(['id'], [
            'name' => 'idx_products_translations_id',
            'comment' => 'Index for product-specific translation queries'
        ]);

        // Create the table
        $table->create();

        // Add foreign key constraint to main products table
        $this->table('products_translations')
            ->addForeignKey('id', 'products', 'id', [
                'delete' => 'CASCADE',
                'update' => 'CASCADE',
                'name' => 'fk_products_translations_id',
                'comment' => 'Cascade operations when product is modified or deleted'
            ])
            ->update();
    }
}
```


## Model Layer Implementation

### Step 1: Product Entity

**File**: `src/Model/Entity/Product.php`

```php
<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Behavior\Translate\TranslateTrait;
use Cake\ORM\Entity;

/**
 * Product Entity
 *
 * @property string $id
 * @property string $user_id
 * @property string $title
 * @property string|null $lede
 * @property bool|null $featured
 * @property bool|null $main_menu
 * @property string|null $body
 * @property string|null $markdown
 * @property string|null $summary
 * @property \Cake\I18n\DateTime|null $created
 * @property \Cake\I18n\DateTime|null $modified
 * @property string|null $slug
 * @property string|null $meta_title
 * @property string|null $meta_description
 * @property string|null $meta_keywords
 * @property string|null $facebook_description
 * @property string|null $linkedin_description
 * @property string|null $twitter_description
 * @property string|null $instagram_description
 * @property int|null $word_count
 * @property string $kind
 * @property string|null $parent_id
 * @property int|null $lft
 * @property int|null $rght
 * @property bool $published
 * @property bool $is_published
 * @property string|null $image
 *
 * @property \App\Model\Entity\User $user
 * @property \App\Model\Entity\Tag[] $tags
 * @property \App\Model\Entity\Image[] $images
 */
class Product extends Entity
{
    use SeoEntityTrait;
    use TranslateTrait;
    use ImageUrlTrait;

    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * @var array<string, bool>
     */
    protected array $_accessible = [
        'user_id' => true,
        'title' => true,
        'lede' => true,
        'featured' => true,
        'main_menu' => true,
        'slug' => true,
        'body' => true,
        'markdown' => true,
        'summary' => true,
        'created' => true,
        'modified' => true,
        'word_count' => true,
        'kind' => true,
        'parent_id' => true,
        'lft' => true,
        'rght' => true,
        'published' => true,
        'is_published' => true,
        'tags' => true,
        'images' => true,
        'image' => true,
        // SEO fields (managed by SeoEntityTrait)
        'meta_title' => true,
        'meta_description' => true,
        'meta_keywords' => true,
        'facebook_description' => true,
        'linkedin_description' => true,
        'twitter_description' => true,
        'instagram_description' => true,
    ];
}
```


### Step 2: Products Table Class

**File**: `src/Model/Table/ProductsTable.php`

```php
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

        // Add timestamp behavior for created/modified fields
        $this->addBehavior('Timestamp');

        // Add hierarchical behavior for product categories
        $this->addBehavior('Orderable', [
            'displayField' => 'title',
        ]);

        // Add slug behavior for SEO-friendly URLs
        $this->addBehavior('Slug', [
            'sourceField' => 'title',
            'targetField' => 'slug',
            'maxLength' => 255,
        ]);

        // Add translation behavior for multi-language support
        $this->addBehavior('Translate', [
            'fields' => [
                'title',
                'lede', 
                'body',
                'summary',
                'meta_title',
                'meta_description',
                'meta_keywords',
                'facebook_description',
                'linkedin_description',
                'twitter_description',
                'instagram_description',
                'alt_text',
                'keywords'
            ],
            'defaultLocale' => 'en_GB',
            'allowEmptyTranslations' => false,
        ]);

        // Add image association behavior
        $this->addBehavior('ImageAssociable');

        // Add commentable behavior for product reviews/comments
        $this->addBehavior('Commentable');

        // Add image upload behavior with queue processing
        $this->addBehavior('QueueableImage', [
            'folder_path' => 'files/Products/image/',
            'field' => 'image',
        ]);

        // Define associations
        $this->belongsTo('Users', [
            'foreignKey' => 'user_id',
            'joinType' => 'INNER',
        ]);

        $this->belongsTo('ParentProduct', [
            'className' => 'Products',
            'foreignKey' => 'parent_id',
        ]);

        $this->hasMany('ChildProducts', [
            'className' => 'Products',
            'foreignKey' => 'parent_id',
        ]);

        $this->belongsToMany('Tags', [
            'foreignKey' => 'product_id',
            'targetForeignKey' => 'tag_id',
            'joinTable' => 'products_tags',
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
```


## Controller Implementation

### Products Controller

**File**: `src/Controller/ProductsController.php`

```php
<?php
declare(strict_types=1);

namespace App\Controller;

use Cake\Http\Exception\NotFoundException;

/**
 * Products Controller
 *
 * @property \App\Model\Table\ProductsTable $Products
 */
class ProductsController extends AppController
{
    /**
     * Index method - Display published products
     *
     * @return \Cake\Http\Response|null|void
     */
    public function index()
    {
        $query = $this->Products
            ->find('published')
            ->contain(['Tags', 'Users'])
            ->orderBy(['Products.created' => 'DESC']);

        $products = $this->paginate($query, [
            'limit' => 12,
            'sortableFields' => ['title', 'created', 'modified']
        ]);

        $this->set(compact('products'));
    }

    /**
     * View method - Display single product
     *
     * @param string|null $slug Product slug
     * @return \Cake\Http\Response|null|void
     * @throws \Cake\Datasource\Exception\RecordNotFoundException
     */
    public function view($slug = null)
    {
        try {
            $product = $this->Products
                ->find('published')
                ->where(['Products.slug' => $slug])
                ->contain(['Tags', 'Users', 'Images'])
                ->firstOrFail();

            // Record page view
            $this->loadModel('PageViews');
            $this->PageViews->save($this->PageViews->newEntity([
                'product_id' => $product->id,
                'ip_address' => $this->request->clientIp(),
                'user_agent' => $this->request->getHeaderLine('User-Agent'),
                'referer' => $this->request->referer()
            ]));

        } catch (\Exception $e) {
            throw new NotFoundException(__('Product not found'));
        }

        $this->set(compact('product'));
    }

    /**
     * Featured products method
     *
     * @return \Cake\Http\Response|null|void
     */
    public function featured()
    {
        $products = $this->Products
            ->find('featured')
            ->find('published')
            ->contain(['Tags', 'Users'])
            ->orderBy(['Products.created' => 'DESC'])
            ->limit(6);

        $this->set(compact('products'));
    }
}
```


### Admin Products Controller

**File**: `src/Controller/Admin/ProductsController.php`

```php
<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use AdminTheme\Controller\Admin\AppController;

/**
 * Products Controller
 * @property \App\Model\Table\ProductsTable $Products
 */
class ProductsController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    public function index()
    {
        $query = $this->Products
            ->find()
            ->contain(['Users', 'Tags']);

        // Add search functionality
        if ($this->request->getQuery('search')) {
            $search = $this->request->getQuery('search');
            $query->where([
                'OR' => [
                    'Products.title LIKE' => '%' . $search . '%',
                    'Products.body LIKE' => '%' . $search . '%'
                ]
            ]);
        }

        $products = $this->paginate($query, [
            'limit' => 25,
            'order' => ['Products.created' => 'DESC'],
            'sortableFields' => ['title', 'created', 'modified', 'published', 'featured']
        ]);

        $this->set(compact('products'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $product = $this->Products->newEmptyEntity();
        
        if ($this->request->is('post')) {
            $data = $this->request->getData();
            $data['user_id'] = $this->Authentication->getIdentity()->getIdentifier();
            $data['kind'] = 'Products';
            
            $product = $this->Products->patchEntity($product, $data, [
                'associated' => ['Tags']
            ]);
            
            if ($this->Products->save($product)) {
                $this->Flash->success(__('The product has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The product could not be saved. Please, try again.'));
        }

        $users = $this->Products->Users->find('list', ['limit' => 200])->all();
        $tags = $this->Products->Tags->find('list', ['limit' => 200])->all();
        
        $this->set(compact('product', 'users', 'tags'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Product id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $product = $this->Products->get($id, [
            'contain' => ['Tags', 'Images']
        ]);
        
        if ($this->request->is(['patch', 'post', 'put'])) {
            $product = $this->Products->patchEntity($product, $this->request->getData(), [
                'associated' => ['Tags']
            ]);
            
            if ($this->Products->save($product)) {
                $this->Flash->success(__('The product has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The product could not be saved. Please, try again.'));
        }

        $users = $this->Products->Users->find('list', ['limit' => 200])->all();
        $tags = $this->Products->Tags->find('list', ['limit' => 200])->all();
        
        $this->set(compact('product', 'users', 'tags'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Product id.
     * @return \Cake\Http\Response|null|void Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $product = $this->Products->get($id);
        
        if ($this->Products->delete($product)) {
            $this->Flash->success(__('The product has been deleted.'));
        } else {
            $this->Flash->error(__('The product could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
```


## Admin Theme Integration

### Update Admin Sidebar

**File**: `plugins/AdminTheme/templates/element/sidebar.php` (Add to existing sidebar)

```php
<!-- Products Section -->
<li class="nav-item">
    <a href="#" class="nav-link">
        <i class="nav-icon fas fa-box"></i>
        <p>
            Products
            <i class="fas fa-angle-left right"></i>
        </p>
    </a>
    <ul class="nav nav-treeview">
        <li class="nav-item">
            <?= $this->Html->link(
                '<i class="far fa-circle nav-icon"></i><p>All Products</p>',
                ['controller' => 'Products', 'action' => 'index', 'prefix' => 'Admin'],
                ['class' => 'nav-link', 'escape' => false]
            ) ?>
        </li>
        <li class="nav-item">
            <?= $this->Html->link(
                '<i class="far fa-circle nav-icon"></i><p>Add Product</p>',
                ['controller' => 'Products', 'action' => 'add', 'prefix' => 'Admin'],
                ['class' => 'nav-link', 'escape' => false]
            ) ?>
        </li>
        <li class="nav-item">
            <?= $this->Html->link(
                '<i class="far fa-circle nav-icon"></i><p>Featured Products</p>',
                ['controller' => 'Products', 'action' => 'index', 'prefix' => 'Admin', '?' => ['featured' => 1]],
                ['class' => 'nav-link', 'escape' => false]
            ) ?>
        </li>
    </ul>
</li>
```


## Background Job Classes

Create AI-powered background jobs for automated product management:

### Product SEO Update Job

**File**: `src/Job/ProductSeoUpdateJob.php`

```php
<?php
declare(strict_types=1);

namespace App\Job;

use App\Service\Api\Anthropic\SeoContentGenerator;
use App\Utility\SettingsManager;
use Cake\Log\LogTrait;
use Cake\ORM\Locator\LocatorAwareTrait;
use Interop\Queue\Message;
use Queue\Job\JobInterface;
use Queue\Job\JobTrait;

/**
 * ProductSeoUpdateJob
 * 
 * Generates SEO content for products using AI
 */
class ProductSeoUpdateJob implements JobInterface
{
    use JobTrait;
    use LogTrait;
    use LocatorAwareTrait;

    /**
     * Executes the job to generate SEO content for a product
     *
     * @param \Interop\Queue\Message $message The message
     * @return void
     */
    public function execute(Message $message): void
    {
        $data = json_decode($message->getBody(), true);
        
        if (!SettingsManager::read('AI.enabled') || !SettingsManager::read('AI.productSEO')) {
            return;
        }

        $productsTable = $this->fetchTable('Products');
        $product = $productsTable->get($data['id']);

        $seoGenerator = new SeoContentGenerator();
        $seoContent = $seoGenerator->generate($product->title, $product->body ?? '');

        if ($seoContent) {
            $product = $productsTable->patchEntity($product, $seoContent);
            $productsTable->save($product, ['noMessage' => true]);
            
            $this->log("SEO content generated for product: {$product->title}", 'info');
        }
    }
}
```


## Running the Migrations

Execute the migrations in proper order:

```bash
# Run the migration commands
bin/cake bake migration_diff CreateProducts
bin/cake bake migration_diff CreateProductsTags  
bin/cake bake migration_diff CreateProductsTranslations

# Execute the migrations
bin/cake migrations migrate
```


## Next Steps Overview

### 1. **View Templates Creation**

- Create product listing and detail view templates
- Implement responsive design matching the existing articles templates
- Add breadcrumb navigation and SEO meta tags


### 2. **AI Job Integration**

- Implement ProductTagUpdateJob for automatic tag generation
- Create ProductSummaryUpdateJob for content summarization
- Set up TranslateProductJob for multi-language support


### 3. **Search Integration**

- Add products to the global search functionality
- Implement product-specific search filters and facets
- Create product sitemap generation


### 4. **Frontend Integration**

- Add product routes to the routing configuration
- Create product widgets for homepage display
- Implement related products functionality using existing tags


### 5. **Testing Suite**

- Create comprehensive unit tests for ProductsTable
- Add controller tests for admin and frontend functionality
- Implement fixture data for automated testing

This implementation provides a complete, production-ready product system that seamlessly integrates with Willow CMS's existing architecture[^1][^2][^3][^4]. The system maintains consistency with the articles structure while providing specialized product management capabilities, full AI integration, and comprehensive internationalization support[^5][^6][^7].

<div style="text-align: center">⁂</div>

[^1]: DeveloperGuide.md

[^2]: README.md

[^3]: https://www.dereuromark.de/2023/12/04/database-migration-tips-for-cakephp/

[^4]: https://book.cakephp.org/migrations/4/en/writing-migrations.html

[^5]: https://book.cakephp.org/5/en/orm/associations.html

[^6]: https://book.cakephp.org/5/en/orm/behaviors.html

[^7]: https://book.cakephp.org/5/en/orm/behaviors/translate.html

[^8]: willow_cms_code.txt

[^9]: composer.json

[^10]: https://github.com/cakephp/phinx/issues/1237

[^11]: https://discourse.cakephp.org/t/best-practice-for-merging-database-migrations/5723

[^12]: https://book.cakephp.org/migrations/2/en/index.html

[^13]: https://stackoverflow.com/questions/58535546/cakephp-3-migrations-specify-key-length-for-text-column-index

[^14]: https://getrector.com/blog/what-to-expect-when-you-plan-to-migrate-away-from-cakephp-2

[^15]: https://www.youtube.com/watch?v=1YhzJ7MJ3Aw

[^16]: https://book.cakephp.org/2/en/console-and-shells/schema-management-and-migrations.html

[^17]: https://stackoverflow.com/questions/14370266/upgrade-from-2-0-5-to-2-2-5

[^18]: https://book.cakephp.org/phinx/0/en/migrations.html

[^19]: https://stackoverflow.com/questions/39904183/cakephp-migrations-how-to-specify-scale-and-precision

[^20]: https://book.cakephp.org/2/en/appendices/2-5-migration-guide.html

[^21]: https://stackoverflow.com/questions/30712896/cakephp-how-to-use-migration-to-insert-records

[^22]: https://book.cakephp.org/4/en/appendices/4-0-migration-guide.html

[^23]: https://cakephp.org

[^24]: https://book.cakephp.org/migrations/3/en/index.html

[^25]: https://book.cakephp.org/5/en/appendices/5-2-migration-guide.html

[^26]: https://book.cakephp.org/3/fr/phinx/migrations.html

[^27]: https://book.cakephp.org/5/en/quickstart.html

[^28]: https://book.cakephp.org/5/en/orm/validation.html

[^29]: https://themesbrand.com/velzon/docs/cakephp/vertical.html

[^30]: https://packagist.org/packages/cakephp/orm

[^31]: https://www.youtube.com/watch?v=zpHoprZZdxk

[^32]: https://clouddevs.com/cakephp/defining-relationships/

[^33]: https://api.cakephp.org/5.0/class-Cake.ORM.Behavior.html

[^34]: https://discourse.cakephp.org/t/best-way-to-programatically-display-or-hide-menus-based-on-role/4719

[^35]: https://book.cakephp.org/5/en/orm/entities.html

[^36]: https://stackoverflow.com/questions/30409904/what-is-the-difference-between-trait-and-behavior-in-cakephp-3

[^37]: http://josediazgonzalez.com/2016/12/06/customizing-the-posts-crudview-dashboard/

[^38]: https://api.cakephp.org/5.2/namespace-Cake.ORM.html

[^39]: https://github.com/fm-labs/cakephp-admin

[^40]: https://ci.cakephp.org/5.2/class-Cake.ORM.Association.BelongsToMany.html

[^41]: https://book.cakephp.org/5/en/orm/database-basics.html

[^42]: https://stackoverflow.com/questions/14962058/best-way-to-implement-admin-panel-in-cakephp

[^43]: https://stackoverflow.com/questions/38415398/laravel-5-2-belongstomany-in-views

[^44]: https://ci.cakephp.org/5.2/class-Cake.ORM.Behavior.TreeBehavior.html

[^45]: https://github.com/matthewdeaves/willow

[^46]: https://discourse.cakephp.org/t/doubt-with-translate-behavior/7706

[^47]: https://discourse.webflow.com/t/cms-creating-tag-label/136211

[^48]: https://pcbbc.site.mobi/site/matthewdeaves/willow?imz_st

[^49]: https://stackoverflow.com/questions/49277634/how-do-you-make-a-translation-field-sluggable-in-cakephp-3-x

[^50]: https://discourse.webflow.com/t/cms-blog-how-do-i-create-and-display-tags-depending-on-predefined-categories-for-different-blog-articles/174806

[^51]: https://discourse.cakephp.org/t/translate-behavior-in-cakephp-5-x/11530

[^52]: https://developers.google.com/search/docs/appearance/structured-data/article

[^53]: https://dev.to/msamgan/slug-behavior-for-cakephp-3-x-making-slug-management-super-easy-4159

[^54]: https://www.youtube.com/watch?v=ESlnN54wn1o

[^55]: https://www.youtube.com/watch?v=ljVrFz79fdA

[^56]: https://discourse.cakephp.org/t/cakephp-5-translate-behavior-translatetrait/12272

[^57]: https://www.tweakdesigns.in/blog/how-to-create-a-blog-using-webflow-cms-part-2

[^58]: https://book.cakephp.org/1.2/en/The-Manual/Developing-with-CakePHP/Behaviors.html

[^59]: https://finsweet.com/seo/article/tags-and-categories-taxonomy

[^60]: https://willowmarketing.com/2020/08/15/what-non-developers-need-to-know-about-wordpress-cms-administration/

[^61]: https://www.bookstack.cn/read/cakephp-3.x-cookbook-en/a73750f5d9a4cfe5.md?wd=entity

[^62]: https://finsweet.com/seo/article/cms-image-dynamic-alt-tags

