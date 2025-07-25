<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\CookieConsent $cookieConsent
 * @var \Cake\Collection\CollectionInterface|string[] $users
 */
?>
<div class="row">
    <aside class="column">
        <div class="side-nav">
            <h4 class="heading"><?= __('Actions') ?></h4>
            <?= $this->Html->link(__('List Cookie Consents'), ['action' => 'index'], ['class' => 'side-nav-item']) ?>
        </div>
    </aside>
    <div class="column column-80">
        <div class="cookieConsents form content">
            <?= $this->Form->create($cookieConsent) ?>
            <fieldset>
                <legend><?= __('Add Cookie Consent') ?></legend>
                <?php
                    echo $this->Form->control('user_id', ['options' => $users, 'empty' => true]);
                    echo $this->Form->control('session_id');
                    echo $this->Form->control('analytics_consent');
                    echo $this->Form->control('functional_consent');
                    echo $this->Form->control('marketing_consent');
                    echo $this->Form->control('essential_consent');
                    echo $this->Form->control('ip_address');
                    echo $this->Form->control('user_agent');
                ?>
            </fieldset>
            <?= $this->Form->button(__('Submit')) ?>
            <?= $this->Form->end() ?>
        </div>
    </div>
</div>
