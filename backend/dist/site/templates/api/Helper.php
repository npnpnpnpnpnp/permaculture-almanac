<?php namespace ProcessWire;

require_once __DIR__ . '/Images.php';
require_once __DIR__ . '/RepeaterMatrix.php';

class Helper {
  public static function setLanguage() {
    if (!isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
      throw new AppApiException("Required header Accept-Language is missing", 400);
    }

    // Sanitize Accept-Language value
    $requestedLang = wire('sanitizer')->selectorValue($_SERVER['HTTP_ACCEPT_LANGUAGE']);

    // Check if requested language is default language (as its name is always 'default')
    $requestedLang = $requestedLang == wire('config')->_defaultLanguage ? 'default' : $requestedLang;

    // Get language
    $lang = wire('languages')->getLanguage($requestedLang);

    // Throw error if language couldn’t be found
    if (!($lang && $lang->id)) {
      throw new AppApiException("Requested language '$requestedLang' not available", 400);
    }

    // Set language
    wire('languages')->setLanguage($lang);
    // wire('user')->language = $lang;
  }

  public static function unsetLanguage() {
    // Recall previous language
    wire('languages')->unsetLanguage();
  }

  public static function getMetadata($page) {
    $page->of(true);
    $response = new \StdClass();
    $response->id = $page->id;
    $response->url = $page->url;
    $response->template = $page->template->name;
    return $response;
  }

  public static function getFields($page, array $exclude = null) {
    $page->of(true);
    $pdata = [];
    foreach ($page->template->fieldgroup as $field) {
      // Skip the following fields
      if (is_array($exclude) && in_array($field->name, $exclude)) continue;
      if ($field->type instanceof FieldtypeFieldsetOpen) continue;
      if ($field->name == 'pdfs') continue;
      if ($field->name == 'files') continue;

      $value = $page->get($field->name);

      if ($field->type instanceof FieldtypeImage) {
        $pdata[$field->name] = Images::get($value);
        continue;
      };

      if ($field->type instanceof FieldtypeFile) {
        $pdata[$field->name] = self::getFiles($value);
        continue;
      }

      if ($field->type instanceof FieldtypePage) {
        $pdata[$field->name] = self::getPageReferences($value);
        continue;
      }

      if ($field->type instanceof FieldtypeOptions) {
        $pdata[$field->name] = self::getSelectOptions($value);
        continue;
      }

      if ($field->type instanceof FieldtypeRepeaterMatrix) {
        $pdata[$field->name] = RepeaterMatrix::get($value);
        continue;
      }

      if ($field->type instanceof FieldtypeRepeater) {
        $pdata[$field->name] = self::getRepeater($value);
        continue;
      }

      if ($field->type instanceof FieldtypeTextarea) {
        $pdata[$field->name] = self::convertToAbsolutePaths($value);
        continue;
      }

      if ($field->type instanceof FieldtypeDatetime) {
        $timestamp = intval($page->getUnformatted($field->name));
        if (!$timestamp) continue;
        $pdata[$field->name] = [
          'formatted' => [
            'date' => strftime('%d.%m.%Y', $timestamp),
            'time' => strftime('%H:%S', $timestamp)
          ],
          'timestamp' => $timestamp
        ];
        continue;
      }

      // TODO: Why do we have to turn of output formatting to (sometimes) get the sleepValue?
      // $page->of(false);
      $pdata[$field->name] = $field->type->sleepValue($page, $field, $value);
    }

    return $pdata;
  }

  public static function getPages($pages, bool $recursive = false, array $exclude = null, $returnArray = true) {
    if (!$pages) return null;
    if ($pages instanceof PageArray && $pages->count) {
      $response = [];
      foreach ($pages as $p) {
        $item = self::getPage($p, $recursive, $exclude);
        array_push($response, $item);
      }
      return $response;
    } else if ($pages && $pages instanceof Page) {
      $p = self::getPage($pages, $recursive, $exclude);
      if ($returnArray) {
        return array($p);
      } else {
        return $p;
      }
    }
  }

  public static function getPage($page, bool $recursive = false, array $exclude = null) {
    // $p->of(true);
    $item = new \StdClass();
    $item->meta = self::getMetadata($page);
    $item->fields = self::getFields($page, $exclude);
    // $item->parent = self::getMetadata($page->parent);
    if ($recursive && $page->hasChildren) {
      $item->children = self::getPages($page->children, $recursive, $exclude);
    }
    return $item;
  }

  public static function getRepeater($pages) {
    $array = [];
    if (!$pages) return $array;
    foreach ($pages as $p) {
      $p->of(true);
      // $item = new \StdClass();
      // $item->meta = self::getMetadata($p);
      // $item->fields = self::getFields($p);
      $item = self::getFields($p);
      array_push($array, $item);
    }
    return $array;
  }

  public static function getPageReferences($pages) {
    if (!$pages) return null;
    if ($pages instanceof PageArray && $pages->count) {
      $response = [];
      foreach ($pages as $p) {
        $item = self::getPageReference($p);
        array_push($response, $item);
      }
      return $response;
    } else if ($pages && $pages instanceof Page) {
      return self::getPageReference($pages);
    }
  }

  public static function getPageReference($page) {
    // $p->of(true);
    $item = new \StdClass();
    $item->meta = self::getMetadata($page);
    // fetch all fields of original item
    $item->fields = self::getFields($page);
    // define explicit fields to be fetched
    // $item->fields = [
    //   'title' => $page->title,
    //   'title' => $page->title,
    //   'body' => $page->body
    // ];
    return $item;
  }

  // TODO: check if multiple items or single
  public static function getSelectOptions($field) {
    return [
      'id' => $field->id,
      'title' => $field->title,
      'value' => $field->value
    ];
  }

  public static function getFiles($field) {
    if (!$field) return null;
    if ($field instanceof Pagefiles && $field->count) {
      $response = [];
      foreach ($field as $f) {
        $item = self::getFile($f);
        array_push($response, $item);
      }
      return $response;
    } else if ($field && $field instanceof Pagefile) {
      return self::getFile($field);
    }
  }

  public static function getFile($file) {
    // $p->of(true);
    $item = new \StdClass();
    $item->ext = $file->ext;
    $item->description = $file->description;
    $item->url = $file->httpUrl;
    return $item;
  }

  public static function getTable($field) {
    $array = [];
    if (!$field) return $array;
    // TODO: make code more universal by looking up columns dynamically
    // $columns = $field->columns;
    foreach ($field as $row) {
      $item = [
        'key' => $row->key,
        'value' => $row->value
      ];
      array_push($array, $item);
    }
    return $array;
  }

  public static function convertToAbsolutePaths($field) {
    return str_replace('/site/assets/files/', wire('config')->urls->httpRoot . 'site/assets/files/', $field);
  }
}
