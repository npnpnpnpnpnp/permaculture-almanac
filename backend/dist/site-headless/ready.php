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
