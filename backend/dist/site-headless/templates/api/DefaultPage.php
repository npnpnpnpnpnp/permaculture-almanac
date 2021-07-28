<?php namespace ProcessWire;

class DefaultPage {
  public static function get($data) {
    Helper::setLanguage();

    if (isset($data->path)) {
      $data = AppApiHelper::checkAndSanitizeRequiredParameters($data, ['path|pagePathNameUTF8']);
      $page = wire('pages')->findOne('/' . $data->path);
    } else {
      $page = wire('pages')->get(1);
    }

    if (!($page && $page->id)) throw new AppApiException("Page not found", 404);

    $page->of(true);

    $response = new \StdClass();
    $response->meta = Helper::getMetadata($page);
    $response->fields = Helper::getFields($page);

    // Include children for the following templates
    // $includeChildren = ['home'];
    // if (in_array($page->template->name, $includeChildren)) {
    //   $response->children = Helper::getPages($page->children);
    // }

    Helper::unsetLanguage();
    return $response;
  }
}
