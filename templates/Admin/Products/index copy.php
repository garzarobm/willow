<?php
/**
 * @var \App\View\AppView $this
 * @var iterable<\App\Model\Entity\Product> $products
 */

// Load search utility scripts
$this->Html->script('AdminTheme.utils/search-handler', ['block' => true]);
$this->Html->script('AdminTheme.utils/popover-manager', ['block' => true]); 
?>

<header class="py-3 mb-3 border-bottom">
    <div class="container-fluid d-flex align-items-center">
        <div class="d-flex align-items-center me-auto">
            <!-- Status Filter -->
            <?= $this->element('status_filter', [
                'filters' => [
                    'all' => ['label' => __('All'), 'params' => []],
                    'filter1' => ['label' => __('Filter 1'), 'params' => ['status' => '0']],
                    'filter2' => ['label' => __('Filter 2'), 'params' => ['status' => '1']],
                ]
            ]) ?>
            
            <!-- Search Form -->
            <?= $this->element('search_form', [
                'id' => 'product-search-form',
                'inputId' => 'productSearch',
                'placeholder' => __('Search Products...'),
                'class' => 'd-flex me-3 flex-grow-1'
            ]) ?>
        </div>
        
        <div class="flex-shrink-0">
            <?= $this->Html->link(
                '<i class="fas fa-plus"></i> ' . __('New Product'),
                ['action' => 'add'],
                ['class' => 'btn btn-success', 'escape' => false]
            ) ?>
        </div>
    </div>
</header>
<div id="ajax-target">
  <table class="table table-striped">
    <thead>
        <tr>
                  <th scope="col"><?= $this->Paginator->sort('id') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('user_id') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('kind') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('featured') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('title') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('lede') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('slug') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('body') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('markdown') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('summary') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('image') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('alt_text') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('keywords') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('name') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('dir') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('size') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('mime') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('is_published') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('created') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('modified') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('published') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('meta_title') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('meta_description') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('meta_keywords') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('facebook_description') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('linkedin_description') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('instagram_description') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('twitter_description') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('word_count') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('parent_id') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('lft') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('rght') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('main_menu') ?></th>
                  <th scope="col"><?= $this->Paginator->sort('view_count') ?></th>
                  <th scope="col"><?= __('Actions') ?></th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($products as $product): ?>
        <tr>
                                                                                    <td><?= h($product->id) ?></td>
                                                      <td><?= $product->hasValue('user') ? $this->Html->link($product->user->username, ['controller' => 'Users', 'action' => 'view', $product->user->id], ['class' => 'btn btn-link']) : '' ?></td>
                                                                                                                        <td><?= h($product->kind) ?></td>
                                                                                                <td><?= h($product->featured) ?></td>
                                                                                                <td><?= h($product->title) ?></td>
                                                                                                <td><?= h($product->lede) ?></td>
                                                                                                <td><?= h($product->slug) ?></td>
                                                                                                <td><?= h($product->body) ?></td>
                                                                                                <td><?= h($product->markdown) ?></td>
                                                                                                <td><?= h($product->summary) ?></td>
                                                                                                <td><?= h($product->image) ?></td>
                                                                                                <td><?= h($product->alt_text) ?></td>
                                                                                                <td><?= h($product->keywords) ?></td>
                                                                                                <td><?= h($product->name) ?></td>
                                                                                                <td><?= h($product->dir) ?></td>
                                                                                                <td><?= $product->size === null ? '' : $this->Number->format($product->size) ?></td>
                                                                                                <td><?= h($product->mime) ?></td>
                                                                                                <td><?= h($product->is_published) ?></td>
                                                                                                <td><?= h($product->created) ?></td>
                                                                                                <td><?= h($product->modified) ?></td>
                                                                                                <td><?= h($product->published) ?></td>
                                                                                                <td><?= h($product->meta_title) ?></td>
                                                                                                <td><?= h($product->meta_description) ?></td>
                                                                                                <td><?= h($product->meta_keywords) ?></td>
                                                                                                <td><?= h($product->facebook_description) ?></td>
                                                                                                <td><?= h($product->linkedin_description) ?></td>
                                                                                                <td><?= h($product->instagram_description) ?></td>
                                                                                                <td><?= h($product->twitter_description) ?></td>
                                                                                                <td><?= $product->word_count === null ? '' : $this->Number->format($product->word_count) ?></td>
                                                                  <td><?= $product->hasValue('parent_product') ? $this->Html->link($product->parent_product->title, ['controller' => 'Products', 'action' => 'view', $product->parent_product->id], ['class' => 'btn btn-link']) : '' ?></td>
                                                                                                            <td><?= $this->Number->format($product->lft) ?></td>
                                                                                                <td><?= $this->Number->format($product->rght) ?></td>
                                                                                                <td><?= h($product->main_menu) ?></td>
                                                                                                <td><?= $this->Number->format($product->view_count) ?></td>
                                    <td>
              <?= $this->element('evd_dropdown', ['model' => $product, 'display' => 'title']); ?>
            </td>
        </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  
  <?= $this->element('pagination') ?>
</div>

<?php $this->Html->scriptStart(['block' => true]); ?>
// Initialize search functionality using AdminTheme utility
AdminTheme.SearchHandler.init({
    searchInputId: 'productSearch',
    resultsContainerId: '#ajax-target',
    baseUrl: '<?= $this->Url->build(['action' => 'index']) ?>',
    debounceDelay: 300
});
<?php $this->Html->scriptEnd(); ?>

