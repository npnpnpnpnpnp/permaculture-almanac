<?php namespace ProcessWire;

if ($config->_production) {
  header('Access-Control-Allow-Origin: ' . $config->_productionFrontendUrl);
  header('Vary: Origin');
} else {
  header('Access-Control-Allow-Origin: *');
}
