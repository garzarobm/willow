<?php
declare(strict_types=1);

namespace ContactManager\Controller;

use App\Controller\AppController;

class ContactManagerAppController extends AppController
{
// ORDER of functions is important here, as initialize() must be called before beforeFilter() to ensure components are loaded.
// The beforeRender() method is called after beforeFilter() and before the view is rendered.
// The beforeFilter() method is called before the controller action is executed.
// The initialize() method is called before any other methods in the controller.
    /**
     * Default configuration.
     *
     * Defines the events this component listens to.
     *
     * @var array
     */
    protected array $_defaultConfig = [
        'implementedEvents' => [
            'Controller.beforeRender' => 'beforeRender'
        ]

}
