<?php namespace ProcessWire;

class DefaultPage {
  public static function get($data) {
    Helper::setLanguage();
    $data = AppApiHelper::checkAndSanitizeRequiredParameters($data, ['id|int']);

    $page = wire('pages')->findOne($data->id);
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
