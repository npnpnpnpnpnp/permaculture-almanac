<?php namespace ProcessWire;

require_once __DIR__ . "/FrontendRoutes.php";

class Defaults {
  public static function get() {
    Helper::setLanguage();

    $response = new \StdClass();
    $homepage = wire('pages')->get(1);
    $homepage->of(true);

    $defaultLang = wire('config')->_defaultLanguage;
    $availableLanguages = wire('config')->_availableLanguages;
    $languages = [];
    foreach (wire('languages') as $lang) {
      $l = $lang->isDefault() ? $defaultLang : $lang->name;
      // Check if language is listed in PW config
      if (!in_array($l, $availableLanguages)) continue;
      array_push($languages, $l);
    }
    $response->availableLanguages = $languages;

    $response->siteTitle = $homepage->title;
    $response->metaDescription = $homepage->meta_description;
    $response->routes = FrontendRoutes::getRoutes();

    Helper::unsetLanguage();

    return $response;
  }
}
