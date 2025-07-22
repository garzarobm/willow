<?php if (!empty($products)) : ?>
<div class="sidebar-section mb-4">
    <h4 class="fst-italic border-bottom pb-2 mb-3"><?= $title ?></h4>
    <div class="sidebar-products-list">
    <?php foreach ($products as $product) : ?>
        <product class="sidebar-product-item mb-3">
            <a class="text-decoration-none" href="<?= $this->Url->build(['_name' => $product->kind . '-by-slug', 'slug' => $product->slug]) ?>" aria-label="<?= h($product->title) ?>">
                <h6 class="sidebar-product-title mb-2 text-body-emphasis"><?= htmlspecialchars_decode($product->title) ?></h6>
            </a>
            
            <div class="sidebar-wrap-container">
                <?php if (!empty($product->image)) : ?>
                <div class="sidebar-image-container">
                    <a href="<?= $this->Url->build(['_name' => $product->kind . '-by-slug', 'slug' => $product->slug]) ?>">
                        <?= $this->element('image/icon', [
                            'model' => $product, 
                            'icon' => $product->tinyImageUrl, 
                            'preview' => false,
                            'class' => 'sidebar-wrap-image'
                        ]); ?>
                    </a>
                </div>
                <?php endif; ?>
                
                <div class="sidebar-text-wrap">
                    <?php if (!empty($product->lede)): ?>
                    <p class="sidebar-product-summary mb-1 text-body-secondary small"><?= $this->Text->truncate(strip_tags($product->lede), 80) ?></p>
                    <?php endif; ?>
                    
                    <small class="sidebar-product-meta text-body-tertiary d-block"><?= $product->published->format('M j, Y') ?></small>
                </div>
            </div>
            
            <?php if ($product !== end($products)): ?>
            <hr class="sidebar-product-separator my-2" />
            <?php endif; ?>
        </product>
    <?php endforeach; ?>
    </div>
</div>
<?php endif; ?>