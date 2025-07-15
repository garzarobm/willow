<?php
declare(strict_types=1);
namespace ContactManager\Test\TestCase\Controller;

use ContactManager\Controller\ContactsController;
use Cake\TestSuite\TestCase;
use Cake\TestSuite\IntegrationTestTrait;

/**
 * ContactManager\Controller\ContactsController Test Case
 *  @uses \ContactManager\Controller\ContactsController
 */
class ContactsControllerTest extends TestCase
{
    use IntegrationTestTrait;

    /**
     * Fixtures
     *
     * @var list<string>
     */
    protected array $fixtures = [
        'app.Articles',
        'app.Comments',
        'app.Slugs',
        'app.Images',
        'app.ArticlesTranslations',
        'app.Users',
        'app.Tags',
        'app.PageViews',
        'app.ModelsImages',
        'app.ArticlesTags'
    ];

    // /**
    //  * Fixtures
    //  *
    //  * @var array
    //  */
    // protected array $fixtures = [
    //     'plugin.ContactManager.Contacts',
    //     'plugin.ContactManager.Users',
    //     'plugin.ContactManager.Groups',
    //     'plugin.ContactManager.ContactsGroups',
    //     'plugin.ContactManager.ContactsTranslations',
    //     'plugin.ContactManager.ContactsImages',
    //     'plugin.ContactManager.ContactsTags',
    //     'plugin.ContactManager.Tags',
    //     'plugin.ContactManager.PageViews',
    //     'plugin.ContactManager.ModelsImages',
    //     'plugin.ContactManager.Slugs',
    //     'plugin.ContactManager.Comments',
    // ];

    /**
     * Test index method
     *
     * @return void
     */
    public function testIndex()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test view method
     *
     * @return void
     */
    public function testView()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test add method
     *
     * @return void
     */
    public function testAdd()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test edit method
     *
     * @return void
     */
    public function testEdit()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test delete method
     *
     * @return void
     */
    public function testDelete()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
