<?php
/**
 * @var \App\View\AppView $this
 * @var iterable<\App\Model\Entity\BlockedIp> $blockedIps
 */
?>
<div class="blockedIps index content">
    <?= $this->Html->link(__('New Blocked Ip'), ['action' => 'add'], ['class' => 'button float-right']) ?>
    <h3><?= __('Blocked Ips') ?></h3>
    <div class="table-responsive">
        <table>
            <thead>
                <tr>
                    <th><?= $this->Paginator->sort('id') ?></th>
                    <th><?= $this->Paginator->sort('ip_address') ?></th>
                    <th><?= $this->Paginator->sort('blocked_at') ?></th>
                    <th><?= $this->Paginator->sort('expires_at') ?></th>
                    <th><?= $this->Paginator->sort('created') ?></th>
                    <th><?= $this->Paginator->sort('modified') ?></th>
                    <th class="actions"><?= __('Actions') ?></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($blockedIps as $blockedIp): ?>
                <tr>
                    <td><?= h($blockedIp->id) ?></td>
                    <td><?= h($blockedIp->ip_address) ?></td>
                    <td><?= h($blockedIp->blocked_at) ?></td>
                    <td><?= h($blockedIp->expires_at) ?></td>
                    <td><?= h($blockedIp->created) ?></td>
                    <td><?= h($blockedIp->modified) ?></td>
                    <td class="actions">
                        <?= $this->Html->link(__('View'), ['action' => 'view', $blockedIp->id]) ?>
                        <?= $this->Html->link(__('Edit'), ['action' => 'edit', $blockedIp->id]) ?>
                        <?= $this->Form->postLink(
                            __('Delete'),
                            ['action' => 'delete', $blockedIp->id],
                            [
                                'method' => 'delete',
                                'confirm' => __('Are you sure you want to delete # {0}?', $blockedIp->id),
                            ]
                        ) ?>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="paginator">
        <ul class="pagination">
            <?= $this->Paginator->first('<< ' . __('first')) ?>
            <?= $this->Paginator->prev('< ' . __('previous')) ?>
            <?= $this->Paginator->numbers() ?>
            <?= $this->Paginator->next(__('next') . ' >') ?>
            <?= $this->Paginator->last(__('last') . ' >>') ?>
        </ul>
        <p><?= $this->Paginator->counter(__('Page {{page}} of {{pages}}, showing {{current}} record(s) out of {{count}} total')) ?></p>
    </div>
</div>