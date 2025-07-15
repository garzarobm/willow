<?php 
declare(strict_types=1);

namespace ContactManager;

use Cake\Routing\Route\DashedRoute;
use Cake\Routing\RouteBuilder;

$routes->plugin(
    'ContactManager',
    ['path' => '/contact-manager'],
    function (RouteBuilder $routes) {
        $routes->setRouteClass(DashedRoute::class);
        $routes->connect('/', ['controller' => 'Contacts', 'action' => 'index']);
// Connect the default routes for the ContactManager plugin.
        // This will connect the /contact-manager/controller/action URLs to the appropriate controller and action.
        // You can add more specific routes as needed.
        // For example, you can add routes for creating, deleting, or listing contacts. 
        $routes->connect(
            '/contacts',
            [
                'controller' => 'Contacts', 
                'action' => 'index'
            ]
        );
        $routes->connect(
            '/contacts/{id}',
            [
                'controller' => 'Contacts',
                'action' => 'view'
            ]
        );
    

        // $builder->fallbacks(DashedRoute::class); // This will connect the default routes for the plugi
        $routes->fallbacks(DashedRoute::class);
    }
);
