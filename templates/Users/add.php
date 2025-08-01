<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\User $user
 */
?>
<div class="row">
    <aside class="column">
        <div class="side-nav">
            <h4 class="heading"><?= __('Actions') ?></h4>
            <?= $this->Html->link(__('List Users'), ['action' => 'index'], ['class' => 'side-nav-item']) ?>
        </div>
    </aside>
    <div class="column column-80">
        <div class="users form content">
            <?= $this->Form->create($user) ?>
            <fieldset>
                <legend><?= __('Add User') ?></legend>
                <?php
                    echo $this->Form->control('is_admin');
                    echo $this->Form->control('email');
                    echo $this->Form->control('password');
                    echo $this->Form->control('image');
                    echo $this->Form->control('alt_text');
                    echo $this->Form->control('keywords');
                    echo $this->Form->control('name');
                    echo $this->Form->control('dir');
                    echo $this->Form->control('size');
                    echo $this->Form->control('mime');
                    echo $this->Form->control('username');
                    echo $this->Form->control('active');
                ?>
            </fieldset>
            <?= $this->Form->button(__('Submit')) ?>
            <?= $this->Form->end() ?>
        </div>
    </div>
</div>
