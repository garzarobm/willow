<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Product $product
 * @var \Cake\Collection\CollectionInterface|string[] $users
 * @var \Cake\Collection\CollectionInterface|string[] $parentProducts
 * @var \Cake\Collection\CollectionInterface|string[] $tags
 */
?>
<div class="row">
    <aside class="column">
        <div class="side-nav">
            <h4 class="heading"><?= __('Actions') ?></h4>
            <?= $this->Html->link(__('List Products'), ['action' => 'index'], ['class' => 'side-nav-item']) ?>
        </div>
    </aside>
    <div class="column column-80">
        <div class="products form content">
            <?= $this->Form->create($product) ?>
            <fieldset>
                <legend><?= __('Add Product') ?></legend>
                <?php
                    echo $this->Form->control('user_id', ['options' => $users]);
                    echo $this->Form->control('kind');
                    echo $this->Form->control('featured');
                    echo $this->Form->control('title');
                    echo $this->Form->control('lede');
                    echo $this->Form->control('slug');
                    echo $this->Form->control('body');
                    echo $this->Form->control('markdown');
                    echo $this->Form->control('summary');
                    echo $this->Form->control('image');
                    echo $this->Form->control('alt_text');
                    echo $this->Form->control('keywords');
                    echo $this->Form->control('name');
                    echo $this->Form->control('dir');
                    echo $this->Form->control('size');
                    echo $this->Form->control('mime');
                    echo $this->Form->control('is_published');
                    echo $this->Form->control('published', ['empty' => true]);
                    echo $this->Form->control('meta_title');
                    echo $this->Form->control('meta_description');
                    echo $this->Form->control('meta_keywords');
                    echo $this->Form->control('facebook_description');
                    echo $this->Form->control('linkedin_description');
                    echo $this->Form->control('instagram_description');
                    echo $this->Form->control('twitter_description');
                    echo $this->Form->control('word_count');
                    echo $this->Form->control('parent_id', ['options' => $parentProducts, 'empty' => true]);
                    echo $this->Form->control('main_menu');
                    echo $this->Form->control('view_count');
                    echo $this->Form->control('tags._ids', ['options' => $tags]);
                ?>
            </fieldset>
            <?= $this->Form->button(__('Submit')) ?>
            <?= $this->Form->end() ?>
        </div>
    </div>
</div>
