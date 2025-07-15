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


        /////////////// Default routes for ContactManager plugin //////////////
        // Connect the default routes for the ContactManager plugin.
        // This will connect the /contact-manager/controller/action URLs to the appropriate controller and action.
        ////// TODO: Add more specific routes as needed.
        $routes->get(
            '/contacts', 
            [
                'controller' => 'Contacts',
                'action' => 'index'
            ]
        );
        $routes->get(
            '/contacts/{id}', 
            [
                'controller' => 'Contacts',
                'action' => 'view'
            ]
        );
        $routes->put(
            '/contacts/{id}', 
            [
                'controller' => 'Contacts',
                'action' => 'update'
            ]
        );

        // Add more routes as needed for the ContactManager plugin.
        // For example, you can add routes for creating, deleting, or listing contacts.
        $routes->post(
            '/contacts', 
            [
                'controller' => 'Contacts',
                'action' => 'add'
            ]
        );
        $routes->delete(
            '/contacts/{id}', 
            [
                'controller' => 'Contacts',
                'action' => 'delete'
            ]
        );

        ///////// END: Default routes for ContactManager plugin /////////

        /*        * Additional routes can be added here.
         * For example, you can add routes for other controllers in the ContactManager plugin.
         * This allows you to keep the ContactManager plugin's routes separate from the main app routes.
         * Useful for testing and organization.
         */
        // $routes->fallbacks(DashedRoute::class); // uncomment this line to use the default DashedRoute for any unmatched routes in the ContactManager plugin.
        // This will fallback to the default DashedRoute for any unmatched routes in the ContactManager plugin.
        // It allows you to use the default CakePHP routing conventions for the ContactManager plugin

    }
);