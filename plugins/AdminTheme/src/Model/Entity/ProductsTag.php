<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * ProductsTag Entity
 *
 * @property string $product_id
 * @property string $tag_id
 *
 * @property \App\Model\Entity\Product $product
 * @property \App\Model\Entity\Tag $tag
 */
class ProductsTag extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array<string, bool>
     */
    protected array $_accessible = [
        'product_id' => true,
        'tag_id' => true,
        'product' => true,
        'tag' => true,
    ];
}
