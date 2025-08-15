<?php
/**
 * @var \App\View\AppView $this
 * @var iterable<\App\Model\Entity\Tag> $tags
 */
?>
<?php ?>
<header class="py-3 mb-3 border-bottom">
    <div class="container-fluid d-flex align-items-center tags">
      <div class="d-flex align-items-center me-auto">
      <ul class="navbar-nav me-3">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false"><?= __('Level') ?></a>
            <ul class="dropdown-menu">
              <?php $activeFilter = $this->request->getQuery('level'); ?>
              <li>
                <?= $this->Html->link(
                    __('All'),
                    ['action' => 'index'],
                    [
                      'class' => 'dropdown-item' . ($activeFilter === null ? ' active' : ''),
                    ],
                ) ?>
              </li>
              <li>
                <?= $this->Html->link(
                    __('Root'),
                    ['action' => 'index', '?' => ['level' => 0]],
                    [
                      'class' => 'dropdown-item' . ($activeFilter === '0' ? ' active' : ''),
                    ],
                ) ?>
              </li>
              <li>
                <?= $this->Html->link(
                    __('Child'),
                    ['action' => 'index', '?' => ['level' => 1]],
                    [
                      'class' => 'dropdown-item' . ($activeFilter === '1' ? ' active' : ''),
                    ],
                ) ?>
              </li>
            </ul>
          </li>
        </ul>
        <div class="btn-group me-3">
            <?= $this->Html->link('
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"></path>
                </svg>
                <span class="visually-hidden">' . __('List View') . '</span>
            ', ['action' => 'index'], [
                'class' => 'btn btn-secondary',
                'escape' => false,
            ]) ?>
            <?= $this->Html->link('
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tree" viewBox="0 0 16 16">
                  <path d="M8.416.223a.5.5 0 0 0-.832 0l-3 4.5A.5.5 0 0 0 5 5.5h.098L3.076 8.735A.5.5 0 0 0 3.5 9.5h.191l-1.638 3.276a.5.5 0 0 0 .447.724H7V16h2v-2.5h4.5a.5.5 0 0 0 .447-.724L12.31 9.5h.191a.5.5 0 0 0 .424-.765L10.902 5.5H11a.5.5 0 0 0 .416-.777zM6.437 4.758A.5.5 0 0 0 6 4.5h-.066L8 1.401 10.066 4.5H10a.5.5 0 0 0-.424.765L11.598 8.5H11.5a.5.5 0 0 0-.447.724L12.69 12.5H3.309l1.638-3.276A.5.5 0 0 0 4.5 8.5h-.098l2.022-3.235a.5.5 0 0 0 .013-.507"/>
                </svg>
                <span class="visually-hidden">' . __('Tree View') . '</span>
            ', ['action' => 'treeIndex'], [
                'class' => 'btn btn-outline-secondary',
                'escape' => false,
            ]) ?>
        </div>
        <form class="d-flex-grow-1 me-3" role="search">
          <input id="tagSearch" type="search" class="form-control" placeholder="<?= __('Search Tags...') ?>" aria-label="Search" value="<?= $this->request->getQuery('search') ?>">
        </form>
      </div>
      <div class="flex-shrink-0">
        <?= $this->Html->link(__('New Tag'), ['action' => 'add'], ['class' => 'btn btn-primary']) ?>
      </div>
    </div>
</header>
<div id="ajax-target">
<table class="table table-striped">
  <thead>
    <tr>
          <th><?= __('Picture') ?></th>
          <th scope="col"><?= $this->Paginator->sort('title') ?></th>
          <th scope="col"><?= $this->Paginator->sort('slug') ?></th>
          <th scope="col"><?= $this->Paginator->sort('parent_id', __('Parent')) ?></th>
          <th scope="col"><?= __('Actions') ?></th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($tags as $tag) : ?>
    <tr>
        <td>
          <?php if (!empty($tag->image)) : ?>
              <div class="position-relative">
                <?= $this->element('image/icon', ['model' => $tag, 'icon' => $tag->teenyImageUrl, 'preview' => $tag->largeImageUrl]); ?>
              </div>
          <?php endif; ?>
        </td>
            <td><?= html_entity_decode($tag->title) ?></td>
            <td><?= h($tag->slug) ?></td>
            <td>
              <?php if (!empty($tag->parent_tag)) : ?>
                    <?= $this->Html->link(
                        h($tag->parent_tag->title),
                        ['controller' => 'Tags', 'action' => 'view', $tag->parent_tag->id],
                    ); ?>
              <?php endif; ?>
            </td>
        <td>
          <?= $this->element('evd_dropdown', ['model' => $tag, 'display' => 'title']); ?>
        </td>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>
<?= $this->element('pagination', ['recordCount' => count($tags), 'search' => $search ?? '']) ?>
</div>
<?php $this->Html->scriptStart(['block' => true]); ?>
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('tagSearch');
    const resultsContainer = document.querySelector('#ajax-target');

    let debounceTimer;

    searchInput.addEventListener('input', function() {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            const searchTerm = this.value.trim();
            
            let url = `<?= $this->Url->build(['action' => 'index']) ?>`;

            <?php if ($activeFilter !== null) : ?>
            url += `?level=<?= urlencode($activeFilter) ?>`;
            <?php endif; ?>

            if (searchTerm.length > 0) {
                url += (url.includes('?') ? '&' : '?') + `search=${encodeURIComponent(searchTerm)}`;
            }

            fetch(url, {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(response => response.text())
            .then(html => {
                resultsContainer.innerHTML = html;
                // Re-initialize popovers after updating the content
                const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
                popoverTriggerList.map(function (popoverTriggerEl) {
                    return new bootstrap.Popover(popoverTriggerEl);
                });
            })
            .catch(error => console.error('Error:', error));

        }, 300); // Debounce for 300ms
    });

    // Initialize popovers on page load
    const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
    popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
    });
});
<?php $this->Html->scriptEnd(); ?>