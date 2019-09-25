<?php namespace ProcessWire;

require_once wire('config')->paths->RestApi . "vendor/autoload.php";
require_once wire('config')->paths->RestApi . "RestApiHelper.php";

require_once __DIR__ . "/Defaults.php";
require_once __DIR__ . "/DefaultPage.php";

$availableLanguages = implode('|', wire('config')->_availableLanguages);

$routes = [
  ['GET', 'defaults/{lang:'.$availableLanguages.'}', Defaults::class, 'get'],
  ['GET', 'page/{id:\d+}/{lang:'.$availableLanguages.'}', DefaultPage::class, 'get'],
];
