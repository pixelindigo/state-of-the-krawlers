<?php if (!defined('APPLICATION')) exit();

// Conversations
$Configuration['Conversations']['Version'] = '2.0.17.10';

// Database
$Configuration['Database']['Name'] = 'dbname';
$Configuration['Database']['Host'] = 'db';
$Configuration['Database']['User'] = 'dbuser';
$Configuration['Database']['Password'] = 'dbpass';

// EnabledApplications
$Configuration['EnabledApplications']['Conversations'] = 'conversations';
$Configuration['EnabledApplications']['Vanilla'] = 'vanilla';

// EnabledPlugins
$Configuration['EnabledPlugins']['GettingStarted'] = 'GettingStarted';
$Configuration['EnabledPlugins']['HtmLawed'] = 'HtmLawed';

// Garden
$Configuration['Garden']['Title'] = 'Vanilla 2';
$Configuration['Garden']['Cookie']['Salt'] = 'CZ4E4XHW4U';
$Configuration['Garden']['Cookie']['Domain'] = '';
$Configuration['Garden']['Version'] = '2.0.17.10';
$Configuration['Garden']['RewriteUrls'] = FALSE;
$Configuration['Garden']['CanProcessImages'] = FALSE;
$Configuration['Garden']['Installed'] = TRUE;
$Configuration['Garden']['Errors']['MasterView'] = 'error.master.php';

// Routes
$Configuration['Routes']['DefaultController'] = 'discussions';

// Vanilla
$Configuration['Vanilla']['Version'] = '2.0.17.10';
