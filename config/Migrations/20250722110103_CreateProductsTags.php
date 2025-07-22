<?php
declare(strict_types=1);

use Migrations\AbstractMigration;
use Cake\Utility\Text;

/**
 * CreateProductsTags Migration
 * 
 * Creates the junction table for many-to-many relationship between products and tags.
 * This mirrors the articles_tags structure and enables flexible product categorization.
 */
class CreateProductsTags extends AbstractMigration
{
    /**
     * Change Method.
     *
     * More information on this method is available here:
     * https://book.cakephp.org/phinx/0/en/migrations.html#the-change-method
     * @return void
     */
    public function up(): void
    {
        $this->table('products_tags', ['id' => false, 'primary_key' => ['product_id', 'tag_id']])
            ->addColumn('product_id', 'uuid', [
                'default' => null,
                'limit' => null,
                'null' => false,
            ])
            ->addColumn('tag_id', 'uuid', [
                'default' => null,
                'limit' => null,
                'null' => false,
            ])
            ->create();
    }

    /**
     * Down Method.
     *
     * More information on this method is available here:
     * https://book.cakephp.org/phinx/0/en/migrations.html#the-down-method
     * @return void
     */
    public function down(): void
    {
        $this->table('products_tags')->drop()->save();
    }
}