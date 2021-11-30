<?php namespace ProcessWire;

class FrontendRoutes {
  public static function getRoutes($pages = null) {
    $routes = [];

    // Add default pages if parameter has not been set
    if (!isset($pages)) {
      $pages = new PageArray();
      $homepage = wire('pages')->get(1);
      $pages->add($homepage);
      $pages->add($homepage->children);
    }

    foreach ($pages as $page) {
      array_push($routes, self::createRoute($page));
    }

    // Add dynamic routes
    // array_push($routes, self::createDynamicRoute(wire('pages')->get('template=parentTemplate'), 'childTemplate', ':name'));

    return $routes;
  }

  private static function createRoute($page) {
    $page->of(true);
    $item = new \StdClass();
    $item->name = $page->id;
    $item->meta = new \StdClass();
    $item->meta->template = $page->template->name;
    $item->meta->title = $page->title;
    $item->meta->url = $page->url;
    $item->path = self::getPath($page);
    return $item;
  }

  private static function createDynamicRoute($parent, $template, $dynamicParam = '') {
    $item = new \StdClass();
    $item->name = $template;
    $item->meta = new \StdClass();
    $item->meta->template = $template;
    $item->meta->title = '';
    $item->meta->url = '';
    $item->path = self::getPath($parent, $dynamicParam);
    return $item;
  }

  private static function getPath($page, $dynamicParam = '') {
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
        ? ltrim($page->localUrl($lang), '/') . $dynamicParam
        : $page->url . $dynamicParam;
    }

    $pathString = $languageSupportPageNames
      ? '/(' . implode('|', $path) . ')'
      : $page->url . $dynamicParam;

    return $pathString;
  }
}
