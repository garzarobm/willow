<?php
/**
 * This file is part of the WillowCMS project.
 * It defines the configuration for the application's routes, datasources, and email transport.
 */
declare(strict_types=1);
/**
 * Routes configuration.
 *
 * In this file, you set up routes to your controllers and their actions.
 * Routes are very important mechanism that allows you to freely connect
 * different URLs to chosen controllers and their actions (functions).
 *
 * It's loaded within the context of `Application::routes()` method which
 * receives a `RouteBuilder` instance `$routes` as method argument.
 *
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link          https://cakephp.org CakePHP(tm) Project
 * @license       https://opensource.org/licenses/mit-license.php MIT License
 */

use Cake\Routing\Route\DashedRoute;
use Cake\Routing\RouteBuilder;
/*
 * This file is loaded in the context of the `Application` class.
  * So you can use  `$this` to reference the application class instance
  * if required.
 */
return function (RouteBuilder $routes): void {
    /*
     * The default class to use for all routes
     *
     * The following route classes are supplied with CakePHP and are appropriate
     * to set as the default:
     *
     * - Route
     * - InflectedRoute
     * - DashedRoute
     *
     * If no call is made to `Router::defaultRouteClass()`, the class used is
     * `Route` (`Cake\Routing\Route\Route`)
     *
     * Note that `Route` does not do any inflections on URLs which will result in
     * inconsistently cased URLs when used with `{plugin}`, `{controller}` and
     * `{action}` markers.
     */

    // Set the default route class to DashedRoute for consistent URL formatting
    $routes->setRouteClass(DashedRoute::class); // Use DashedRoute for consistent URL formatting


    // Set the default extensions for routes
    $routes->setExtensions(['xml', 'rss']); // Set default extensions for routes

    // --------- Root routes ---------
    // Root robots.txt route must come before the scope
    $routes->connect( // Changed from /robots to /robots.txt
        '/robots.txt',
        [
            'controller' => 'Robots',
            'action' => 'index'
        ],
        [
            '_name' => 'robots-root' // Changed from 'robots' to 'robots-root' to avoid conflict with language-specific routes 
        ]
    );

    // Root sitemap.xml route must come before the scope
    $routes->connect( // Changed from /sitemap to /sitemap.xml
        '/sitemap',
        [
            'controller' => 'Sitemap',
            'action' => 'index',
            '_ext' => 'xml'
        ],
        [
            '_name' => 'sitemap-root' // Changed from 'sitemap' to 'sitemap-root'
        ]
    );

    // --------- Language-specific routes ---------
    // Connect the default routes for all controllers.
    $routes->scope('/', function (RouteBuilder $builder): void {
        
        $builder->setExtensions(['xml', 'rss']);
        
        // // Connect the default routes for all controllers.
        // // This will connect the /controller/action URLs to the appropriate controller and action.
        $builder->connect(
            '/', 
            ['controller' => 'Articles', 
            'action' => 'index']
        );
        // This connects the root URL to the Articles controller's index action
        $builder->connect(
            '/',
            [
                'controller' => 'Articles',
                'action' => 'index'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'home'
            ]
        );
        // Language-specific robots.txt route
        $builder->connect(
            '/{lang}/robots.txt',
            [
                'controller' => 'Robots',
                'action' => 'index'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'robots',
                'lang' => '[a-z]{2}',
                'pass' => ['lang']
            ]
        );
        // Language-specific sitemap route
        $builder->connect(
            '/{lang}/sitemap',
            [
                'controller' => 'Sitemap',
                'action' => 'index',
                '_ext' => 'xml'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'sitemap',
                'lang' => '[a-z]{2}',
                'pass' => ['lang']
            ]
        );
        // Language-specific rss route
        $builder->connect(
            '/{lang}/feed',  // Changed from /rss to /feed
            [
                'controller' => 'Rss',
                'action' => 'index',
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'rss',
                'lang' => '[a-z]{2}',
                'pass' => ['lang']
            ]
        );
        // Language-specific user route
        $builder->connect(
            '/users/login',
            [
                'controller' => 'Users',
                'action' => 'login'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'login',
            ]
        );
        // Language-specific register route
        $builder->connect(
            '/users/register',
            [
                'controller' => 'Users',
                'action' => 'register'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'register',
            ]
        );
        // Language-specific forgot password route
        $builder->connect(
            '/users/forgot-password',
            [
                'controller' => 'Users',
                'action' => 'forgot-password'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'forgot-password',
            ]
        );
        // Language-specific reset password route
        $builder->connect(
            '/users/reset-password/{confirmationCode}',
            [
                'controller' => 'Users',
                'action' => 'reset-password'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'reset-password',
                'pass' => ['confirmationCode'],
            ]
        );
        // Language-specific logout route
        $builder->connect(
            '/users/logout',
            [
                'controller' => 'Users',
                'action' => 'logout'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'logout',
            ]
        );
        // Language-specific confirm email route
        $builder->connect(
            '/users/confirm-email/{confirmationCode}',
            [
                'controller' => 'Users',
                'action' => 'confirmEmail'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'confirm-email',
                'pass' => ['confirmationCode'],
            ]
        );
        // Language-specific account edit route
        $builder->connect('/users/edit/{id}', 
            [
                'controller' => 'Users',
                'action' => 'edit'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'account',
                'pass' => ['id'],
            ]
        );
        // Language-specific article routes
        $builder->connect('/articles/add-comment/*', 
        ['controller' => 'Articles', 'action' => 'addComment'], ['routeClass' => 'ADmad/I18n.I18nRoute']);
        // Language-specific tags index route
        $builder->connect(
            '/tags',
            ['controller' => 'Tags', 'action' => 'index'],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'tags-index',
            ],
        );
        // Language-specific article by slug route
        $builder->connect(
            'articles/{slug}',
            [
                'controller' => 'Articles',
                'action' => 'view-by-slug'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'article-by-slug',
                'pass' => ['slug'],
            ]
        );
        // Language-specific page by slug routes
        $builder->connect(
            'pages/{slug}',
            [
                'controller' => 'Articles',
                'action' => 'view-by-slug'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'page-by-slug',
                'pass' => ['slug'] 
            ]
        );
        // Language-specific tag by slug route
        $builder->connect(
            'tags/{slug}',
            [
                'controller' => 'Tags',
                'action' => 'view-by-slug'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'tag-by-slug',
                'pass' => ['slug'] 
            ]
        );
        
        


        // Language-specific cookie consent route
        $builder->connect(  
            'cookie-consents/edit',
            [
                'controller' => 'CookieConsents',
                'action' => 'edit'
            ],
            [
                'routeClass' => 'ADmad/I18n.I18nRoute',
                '_name' => 'cookie-consent',
            ]
        );
        /////////////////// END: Default connected routes from v1.4.0

                //// START: Product routes ///////////
        // $builder->connect('/{lang}/products', ['controller' => 'Products', 'action' => 'index']);
        // $builder->connect(
        //     '/{lang}/products',
        //     [
        //         'controller' => 'Products',
        //         'action' => 'index'
        //     ],
        //     [
        //         'routeClass' => 'ADmad/I18n.I18nRoute',
        //         '_name' => 'products-index',
        //         'lang' => '[a-z]{2}',
        //         'pass' => ['lang']
        //     ]
        // );
        // $builder->connect('/products/add-comment/*', ['controller' => 'Products', 'action' => 'addComment'], ['routeClass' => 'ADmad/I18n.I18nRoute']);
        // $builder->connect(
        //     '/product-tags',
        //     ['controller' => 'ProductTags', 'action' => 'index'],
        //     [
        //         'routeClass' => 'ADmad/I18n.I18nRoute',
        //         '_name' => 'product-tags-index',
        //     ]
        // );
        
        // $builder->connect(
        //     'products/{slug}',
        //     [
        //         'controller' => 'Products',
        //         'action' => 'view-by-slug'
        //     ],
        //     [
        //         'routeClass' => 'ADmad/I18n.I18nRoute',
        //         '_name' => 'product-by-slug',
        //         'pass' => ['slug'],
        //     ]
        // );
        // Language-specific cookie consent route

                //// END: Product routes ///////////
    });



    ///////////// Admin routes ////////////
    // // Connect the admin routes for products.
    // // This will connect the /controller/action URLs to the appropriate controller and action.
    // $routes->prefix('Admin', function (RouteBuilder $routes) { // Admin prefix routes
    //     $routes->connect(
    //         '/{controller}',
    //         ['action' => 'index'],
    //         ['routeClass' => 'DashedRoute']
    //     );  // Connects /admin/controller to /admin/controller/index

    //     $routes->connect(
    //         '/{controller}/{action}/*',
    //         [],
    //         ['routeClass' => 'DashedRoute']
    //     );
        // This connects /admin/controller/action/* to the appropriate controller and action
    // });
    // END: Admin routes

    // });
    


    // Admin prefix routes
    $routes->prefix('Admin', function (RouteBuilder $routes) { // Admin prefix routes
        $routes->connect('/', 
        ['controller' => 'Articles', 'action' => 'index', 'prefix' => 'Admin']
        ); // Connects /admin to /admin/articles/index
        
        // Specific route for removing images from galleries
        $routes->connect(
            '/image-galleries/remove-image/{id}/{imageId}',
            ['controller' => 'ImageGalleries', 'action' => 'removeImage'],
            ['pass' => ['id', 'imageId']]
        );
        
        $routes->fallbacks(DashedRoute::class); // Use DashedRoute for consistent URL formatting
    });
    // END: Admin prefix routes


    // --------- Plugin routes ---------
    // ContactManager plugin routes
    // - Connect /contact-manager prefix to plugin's controllers/actions.
    // - Uses plugin's config/routes.php for DRY structure.
    // - Keeps ContactManager routes separate from main app routes.
    // - Useful for testing and organization.
    $routes->scope('/', function (RouteBuilder $routes) {
        // Connect other routes.
        $routes->scope('/backend', function (RouteBuilder $routes) {
            $routes->loadPlugin('ContactManager');
        });
    });
    // // END: ContactManager plugin routes





    //////////// DebugKit routes ////////////
    // Connect the DebugKit plugin routes

    /*
     * Connect the default routes for all controllers.
     * This will connect the /controller/action URLs to the appropriate controller and action.
     * Add DebugKit routes with proper context if in debug mode.
     * DebugKit routes are only loaded in debug mode.
     * This allows you to access the DebugKit toolbar and panels.
     */
    if (\Cake\Core\Configure::read('debug')) {
        $routes->plugin('DebugKit', function (RouteBuilder $routes) {
            $routes->fallbacks();
        });
    }

};