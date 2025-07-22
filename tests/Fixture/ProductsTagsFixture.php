<?php
declare(strict_types=1);

namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * ProductsTagsFixture
 */
class ProductsTagsFixture extends TestFixture
{
    /**
     * Init method
     *
     * @return void
     */
    public function init(): void
    {
        $this->records = [
            [
                'product_id' => '286093bb-ccc1-4ae4-ac30-f95fdace7ae0',
                'tag_id' => '7098f505-3969-4223-828e-88f0f54b1f48',
            ],
        ];
        parent::init();
    }
}
