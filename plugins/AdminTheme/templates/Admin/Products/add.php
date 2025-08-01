<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Product $product
 * @var \Cake\Collection\CollectionInterface|string[] $users
 * @var \Cake\Collection\CollectionInterface|string[] $images
 * @var \Cake\Collection\CollectionInterface|string[] $tags
 */
?>
<?php use App\Utility\SettingsManager; ?>

<?php if(SettingsManager::read('Editing.editor') == 'trumbowyg') : ?>
<?= $this->Html->css('https://cdn.jsdelivr.net/npm/trumbowyg@2.28.0/dist/ui/trumbowyg.min.css'); ?>
<?= $this->Html->css('https://cdn.jsdelivr.net/npm/trumbowyg@2.28.0/dist/plugins/table/ui/trumbowyg.table.min.css'); ?>
<?= $this->Html->css('https://cdn.jsdelivr.net/npm/trumbowyg@2.28.0/dist/plugins/table/ui/trumbowyg.table.min.css'); ?>
<?= $this->Html->css('https://cdn.jsdelivr.net/npm/trumbowyg@2.28.0/dist/plugins/colors/ui/trumbowyg.colors.min.css'); ?>

<?= $this->Html->script('https://cdn.jsdelivr.net/npm/trumbowyg@2.28.0/dist/trumbowyg.min.js'); ?>
<?= $this->Html->script('https://cdn.jsdelivr.net/npm/trumbowyg@2.28.0/dist/plugins/colors/trumbowyg.colors.min.js'); ?>
<?= $this->Html->script('https://cdn.jsdelivr.net/npm/trumbowyg@2.28.0/dist/plugins/upload/trumbowyg.upload.min.js'); ?>
<?= $this->Html->script('https://cdn.jsdelivr.net/npm/trumbowyg@2.28.0/dist/plugins/table/trumbowyg.table.min.js'); ?>
<?= $this->Html->script('https://cdn.jsdelivr.net/npm/trumbowyg@2.28.0/dist/plugins/preformatted/trumbowyg.preformatted.min.js'); ?>

<?= $this->Html->script('AdminTheme.trumbowyg-edit') ?>
<?php endif; ?>

<?php if(SettingsManager::read('Editing.editor') == 'markdownit') : ?>
<?= $this->Html->script('AdminTheme.markdown-it-edit') ?>
<?php endif; ?>

<meta name="csrfToken" content="<?= $this->request->getAttribute('csrfToken') ?>">

<?php $kind = $this->request->getQuery('kind'); ?>
<?php if (!$product->isNew()): ?>
<?php
    echo $this->element('actions_card', [
<<<<<<< HEAD
        'modelName' => ($kind == 'page') ? 'Page' : 'Product',
=======
        'modelName' => ($kind == 'post') ? 'Page' : 'Product',
>>>>>>> e7397e3034035101febf4710cb40815e58d61f8e
        'controllerName' => 'Products',
        'controllerIndexAction' => ($kind == 'page') ? 'tree-index' : 'index',
        'entity' => $product,
        'urlParams' => ($kind == 'page') ? ['kind' => 'page'] : [],
    ]);
?>
<?php endif; ?>
<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <div class="card mb-4">
                <div class="card-header">
<<<<<<< HEAD
                    <h5 class="card-title"><?= ($kind == 'page') ? __('Add Page') : __('Add Post') ?></h5>
=======
                    <h5 class="card-title"><?= ($kind == 'post') ? __('Add Product') : __('Add Post') ?></h5>
>>>>>>> e7397e3034035101febf4710cb40815e58d61f8e
                </div>
                <div class="card-body">
                    <?= $this->Form->create($product,
                    [
                        'type' => 'file',
                        'enctype' => 'multipart/form-data',
<<<<<<< HEAD
                        'class' => 'needs-validation', 'novalidate' => true
=======
>>>>>>> e7397e3034035101febf4710cb40815e58d61f8e
                    ]) ?>
                    <fieldset>
                        <?= $this->element('form/product', ['kind' => $kind]) ?>
                        <?= $this->element('form/seo') ?>                                                
                    </fieldset>
                    <div class="form-group">
                        <?= $this->Form->button(__('Submit'), ['class' => 'btn btn-primary']) ?>
                    </div>
                    <?= $this->Form->end() ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->element('js/semanticui/dropdown', ['selector' => '#tags-select']); ?>