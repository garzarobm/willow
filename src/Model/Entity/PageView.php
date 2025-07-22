<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * PageView Entity
 *
 * @property string $id
 * @property string|null $article_id Legacy field for backward compatibility
 * @property string|null $model Model name (Articles or Products)
 * @property string|null $foreign_key UUID of the related record
 * @property string $ip_address
 * @property string|null $user_agent
 * @property string|null $referer
 * @property \Cake\I18n\DateTime|null $created
 * @property \Cake\I18n\DateTime|null $modified
 *
 * @property \App\Model\Entity\Article|null $article
 * @property \App\Model\Entity\Product|null $product
 */
class PageView extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * @var array<string, bool>
     */
    protected array $_accessible = [
        'article_id' => true, // Legacy support
        'model' => true,
        'foreign_key' => true,
        'ip_address' => true,
        'user_agent' => true,
        'referer' => true,
        'created' => true,
        'modified' => true,
        'article' => true,
        'product' => true,
    ];
    
    /**
     * Get the related content entity (Article or Product)
     *
     * @return \App\Model\Entity\Article|\App\Model\Entity\Product|null
     */
    public function getRelatedContent()
    {
        if ($this->model === 'Articles') {
            return $this->polymorphic_article ?? $this->article;
        } elseif ($this->model === 'Products') {
            return $this->product;
        } elseif (!empty($this->article_id)) {
            // Legacy support
            return $this->article;
        }
        
        return null;
    }
    
    /**
     * Check if this is a legacy page view record
     *
     * @return bool
     */
    public function isLegacy(): bool
    {
        return empty($this->model) && !empty($this->article_id);
    }
}
