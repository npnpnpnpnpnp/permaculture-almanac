<?php namespace ProcessWire;

// Adjust "View site" link in user navigation if a frontend URL has been set in config.php
if (wire()->config->_productionFrontendUrl) {
  wire()->addHookAfter('AdminThemeFramework::getUserNavArray', function($event) {
    $value = $event->return;
    $viewSite = array_search(wire()->urls->root, $value);
    $value[$viewSite]['url'] = wire()->config->_productionFrontendUrl;
    $event->return = $value;
  });
}

// Clear all caches when a page is saved
$pages->addHookAfter('saveReady', function($event) {
  $procache = wire()->modules->get("ProCache");
  $procache->clearAll();
});

// On-demand mirroring of remote files to local environment
wire()->addHookAfter('Pagefile::url', null, 'mirrorFiles');
wire()->addHookAfter('Pagefile::filename', null, 'mirrorFiles');
function mirrorFiles($event) {
  $config = $event->wire('config');
  $file = $event->return;

  if (!$config->_productionBackendUrl) return;

  // TODO: method is too generic, as it affects e.g. also DB dump uploads
  if ($event->method == 'url') {
    // Convert url to disk path
    $file = $config->paths->root . substr($file, strlen($config->urls->root));
  }

  if (!file_exists($file)) {
    // Download file from source if it doesn't exist locally
    $src = $config->_productionBackendUrl . '/site/assets/files/';
    $url = str_replace($config->paths->files, $src, $file);
    $http = new WireHttp();
    $http->download($url, $file);
  }
}
