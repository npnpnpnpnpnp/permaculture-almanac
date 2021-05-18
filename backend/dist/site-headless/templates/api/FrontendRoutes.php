<?php namespace ProcessWire;

class FrontendRoutes {
  public static function getRoutes() {
    $routes = [];

    $pages = new PageArray();
    $homepage = wire('pages')->get(1);
    $pages->add($homepage);
    $pages->add($homepage->children);
    // NOTE: Add more pages if necessary

    foreach ($pages as $page) {
      array_push($routes, self::createRoute($page));
    }

    return $routes;
  }

  private static function createRoute($page) {
    $page->of(true);

    $item = new \StdClass();
    $item->name = $page->id;

    // TODO: Set vue-router dynamic routing via API?
    // if ($page->template->name === 'basic-page') $item->dynamicRoute = ':id';

    $item->meta = new \StdClass();
    $item->meta->template = $page->template->name;
    $item->meta->title = $page->title;
    $item->meta->url = $page->url;

    $defaultLang = wire('config')->_defaultLanguage;
    $availableLanguages = wire('config')->_availableLanguages;
    // TODO: Declare this only once for the whole class
    $languageSupportPageNames = wire('modules')->isInstalled('LanguageSupportPageNames');
    $path = [];
    foreach (wire('languages') as $lang) {
      $l = $lang->isDefault() ? $defaultLang : $lang->name;

      // Check if language is listed in PW config
      if (!in_array($l, $availableLanguages)) continue;

      $path[] = $languageSupportPageNames
        ? ltrim($page->localUrl($lang), '/')
        : $page->url;
    }
    $item->path = $languageSupportPageNames
      ? '/(' . implode('|', $path) . ')'
      : $page->url;

    return $item;
  }
}
