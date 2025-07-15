# ContactManager Plugin Configuration and Hooks
This document outlines the configuration and hooks available for the ContactManager plugin in WillowCMS. The plugin is designed to manage contacts and integrates seamlessly with the WillowCMS framework.
Plugins offer several hooks that allow a plugin to inject itself into the appropriate parts of your application. The hooks are:

### Hooks Overview
- **bootstrap**: Used to load plugin default configuration files, define constants, and other global functions. The bootstrap method is passed the current Application instance, giving you broad access to the DI container and configuration.
- **routes**: Used to load routes for a plugin. Fired after application routes are loaded.
- **middleware**: Used to add plugin middleware to an application’s middleware queue.
- **console**: Used to add console commands to an application’s command collection. 
- **services**: Used to register application container services. This is a good opportunity to set up additional objects that need access to the container.
### Plugin Hoobootstrap Used to load plugin default configuration files, define constants and other global functions. The bootstrap method is passed the current Application instance giving you broad access to the DI container and configuration.
