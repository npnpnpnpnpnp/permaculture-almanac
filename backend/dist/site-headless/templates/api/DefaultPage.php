<?php namespace ProcessWire;

require_once __DIR__ . '/Helper.php';

class DefaultPage {
  public static function get($data) {
    $data = RestApiHelper::checkAndSanitizeRequiredParameters($data, ['id|int', 'lang']);
    $page = wire('pages')->findOne($data->id);
    $response = new \StdClass();

    $language = wire('user')->language;
    wire('user')->language = wire('languages')->get($data->lang);

    if (!$page->id) throw new \Exception("Page not found", 404);

    $page->of(true);

    $response->meta = Helper::getMetadata($page);
    $response->fields = Helper::getFields($page);

    wire('user')->language = $language;

    return $response;
  }
}
