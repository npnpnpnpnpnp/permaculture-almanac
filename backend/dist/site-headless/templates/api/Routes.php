<?php namespace ProcessWire;

require_once wire('config')->paths->AppApi . "vendor/autoload.php";
require_once wire('config')->paths->AppApi . "classes/AppApiHelper.php";

require_once __DIR__ . "/Helper.php";

require_once __DIR__ . "/Defaults.php";
require_once __DIR__ . "/DefaultPage.php";

$routes = [
  'v1' => [
    'defaults' => [
      ['OPTIONS', '', ['GET']],
      ['GET', '', Defaults::class, 'get'],
    ],
    'page' => [
      ['OPTIONS', '{id:\d+}', ['GET']],
      ['GET', '{id:\d+}', DefaultPage::class, 'get'],
    ]
  ]
];
