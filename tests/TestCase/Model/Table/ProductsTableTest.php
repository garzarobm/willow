<?php
declare(strict_types=1);

namespace App\Test\TestCase\Model\Table;

use App\Model\Table\ProductsTable;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\ProductsTable Test Case
 */
class ProductsTableTest extends TestCase
{
    /**
     * Test subject
     *
     * @var \App\Model\Table\ProductsTable
     */
    protected $Products;

    /**
     * Fixtures
     *
     * @var list<string>
     */
    protected array $fixtures = [
        'app.Products',
        'app.Comments',
        'app.Slugs',
        'app.Images',
        'app.ProductsTranslations',
        'app.Users',
        'app.Tags',
        'app.PageViews',
    ];

    /**
     * setUp method
     *
     * @return void
     */
    protected function setUp(): void
    {
        parent::setUp();
        $config = $this->getTableLocator()->exists('Products') ? [] : ['className' => ProductsTable::class];
        $this->Products = $this->getTableLocator()->get('Products', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    protected function tearDown(): void
    {
        unset($this->Products);

        parent::tearDown();
    }

    /**
     * Test validationDefault method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::validationDefault()
     */
    public function testValidationDefault(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test buildRules method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::buildRules()
     */
    public function testBuildRules(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test beforeSave method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::beforeSave()
     */
    public function testBeforeSave(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test afterSave method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::afterSave()
     */
    public function testAfterSave(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test getFeatured method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::getFeatured()
     */
    public function testGetFeatured(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test getRootPages method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::getRootPages()
     */
    public function testGetRootPages(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test getMainMenuPages method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::getMainMenuPages()
     */
    public function testGetMainMenuPages(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test getArchiveDates method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::getArchiveDates()
     */
    public function testGetArchiveDates(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test getRecentProducts method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::getRecentProducts()
     */
    public function testGetRecentProducts(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test addImageValidationRules method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::addImageValidationRules()
     */
    public function testAddImageValidationRules(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test addRequiredImageValidation method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::addRequiredImageValidation()
     */
    public function testAddRequiredImageValidation(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test addOptionalImageValidation method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::addOptionalImageValidation()
     */
    public function testAddOptionalImageValidation(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test log method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::log()
     */
    public function testLog(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test queueJob method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::queueJob()
     */
    public function testQueueJob(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test queueJobs method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::queueJobs()
     */
    public function testQueueJobs(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test queueDelayedJob method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::queueDelayedJob()
     */
    public function testQueueDelayedJob(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test emptySeoFields method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::emptySeoFields()
     */
    public function testEmptySeoFields(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test emptyTranslationFields method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::emptyTranslationFields()
     */
    public function testEmptyTranslationFields(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test updateEmptySeoFields method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::updateEmptySeoFields()
     */
    public function testUpdateEmptySeoFields(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test translation method
     *
     * @return void
     * @uses \App\Model\Table\ProductsTable::translation()
     */
    public function testTranslation(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
