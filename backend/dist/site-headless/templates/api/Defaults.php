<?php namespace ProcessWire;

require_once __DIR__ . "/Navigation.php";

class Defaults {
  public static function get($data) {
    $data = RestApiHelper::checkAndSanitizeRequiredParameters($data, ['lang']);
    $response = new \StdClass();

    $homepage = wire('pages')->get(1);
    $homepage->of(true);

    $defaultLang = wire('config')->_defaultLanguage;
    $availableLanguages = wire('config')->_availableLanguages;
    $languages = [];
    $siteTitle = [];
    $metaDescription = [];
    foreach (wire('languages') as $lang) {
      $l = $lang->isDefault() ? $defaultLang : $lang->name;

      // Check if language is listed in PW config
      if (!in_array($l, $availableLanguages)) continue;

      $langItem = ['name' => $l];
      array_push($languages, $langItem);
      $siteTitle[$l] = $homepage->getLanguageValue($lang, 'title');
      $metaDescription[$l] = $homepage->getLanguageValue($lang, 'meta_description');
    }
    $response->availableLanguages = $languages;
    $response->siteTitle = $siteTitle;
    $response->metaDescription = $metaDescription;

    $language = wire('user')->language;
    wire('user')->language = wire('languages')->get($data->lang);
    $response->currentLanguage = wire('user')->language->isDefault()
      ? $defaultLang
      : wire('user')->language->name;

    $response->apiRoutes = Navigation::getRoutes();

    return $response;
  }
}
