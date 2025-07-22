<?php
declare(strict_types=1);

namespace App\Job;

use App\Service\Api\Anthropic\SeoContentGenerator;
use App\Utility\SettingsManager;
use Cake\Log\LogTrait;
use Cake\ORM\Locator\LocatorAwareTrait;
use Interop\Queue\Message;
use Queue\Job\JobInterface;
use Queue\Job\JobTrait;

/**
 * ProductSeoUpdateJob
 * 
 * Generates SEO content for products using AI
 */
class ProductSeoUpdateJob implements JobInterface
{
    use JobTrait;
    use LogTrait;
    use LocatorAwareTrait;

    /**
     * Executes the job to generate SEO content for a product
     *
     * @param \Interop\Queue\Message $message The message
     * @return void
     */
    public function execute(Message $message): void
    {
        $data = json_decode($message->getBody(), true);
        
        if (!SettingsManager::read('AI.enabled') || !SettingsManager::read('AI.productSEO')) {
            return;
        }

        $productsTable = $this->fetchTable('Products');
        $product = $productsTable->get($data['id']);

        $seoGenerator = new SeoContentGenerator();
        $seoContent = $seoGenerator->generate($product->title, $product->body ?? '');

        if ($seoContent) {
            $product = $productsTable->patchEntity($product, $seoContent);
            $productsTable->save($product, ['noMessage' => true]);
            
            $this->log("SEO content generated for product: {$product->title}", 'info');
        }
    }
}
