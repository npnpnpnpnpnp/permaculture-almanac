<?php namespace ProcessWire;

class Navigation {
  public static function getRoutes() {
    $routes = [];

    $pages = new PageArray();
    $homepage = wire('pages')->get(1);
    $pages->add($homepage);
    $pages->add($homepage->children);

    foreach ($pages as $page) {
      array_push($routes, self::createRouteItem($page));
    }

    return $routes;
  }

  private static function createRouteItem($page) {
    $page->of(true);

    $item = new \StdClass();
    $item->id = $page->id;
    $item->template = $page->template->name;

    $defaultLang = wire('config')->_defaultLanguage;
    $availableLanguages = wire('config')->_availableLanguages;
    $title = [];
    $url = [];
    foreach (wire('languages') as $lang) {
      $l = $lang->isDefault() ? $defaultLang : $lang->name;

      // Check if language is listed in PW config
      if (!in_array($l, $availableLanguages)) continue;

      $title[$l] = $page->getLanguageValue($lang, 'title');
      $url[$l] = wire('modules')->isInstalled('FieldtypePageTitleLanguage')
        ? $page->localUrl($lang)
        : $page->url;
    }
    $item->title = $title;
    $item->url = $url;

    // TODO: Set vue-router dynamic routing via API?
    // if ($page->template->name === 'basic-page') $item->dynamicRoute = ':id';

    // TODO: Rename apiChildren to children as soon as router.js plays along nicely
    if ($page->hasChildren) {
      $item->apiChildren = [];

      if ($page->template->name === 'home') unset($item->apiChildren);

      if (isset($item->apiChildren)) {
        foreach ($page->children as $child) {
          array_push($item->apiChildren, self::createRouteItem($child));
        }
      }
    }

    return $item;
  }
}
