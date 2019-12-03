<?php namespace ProcessWire;

require_once __DIR__ . '/Content.php';
require_once __DIR__ . '/Images.php';

class Helper {
  public static function getMetadata($page) {
    $page->of(true);
    $response = new \StdClass();
    $response->id = $page->id;
    $response->url = $page->url;
    return $response;
  }

  public static function getFields($page) {
    $page->of(true);
    $pdata = [];
    foreach ($page->template->fieldgroup as $field) {
      // Skip the following fields
      if ($field->type instanceof FieldtypeFieldsetOpen) continue;
      if ($field->name == 'pdfs') continue;

      $value = $page->get($field->name);

      if ($field->name == 'content') {
        $pdata[$field->name] = Content::get($value);
        continue;
      }

      if ($field->type instanceof FieldtypeImage || $field->type instanceof FieldtypeImages) {
        $pdata[$field->name] = Images::get($value, ['200']);
        continue;
      };

      if ($field->type instanceof FieldtypePage) {
        $pdata[$field->name] = self::getPageReferences($value);
        continue;
      }

      if ($field->type instanceof FieldtypeOptions) {
        $pdata[$field->name] = self::getSelectOptions($value);
        continue;
      }

      if ($field->type instanceof FieldtypeRepeater) {
        $items = [];
        foreach ($value as $singleValue) {
          $item = self::getFields($singleValue);
          array_push($items, $item);
        }
        $pdata[$field->name] = $items;
        continue;
      }

      if ($field->type instanceof FieldtypeTextarea) {
        $pdata[$field->name] = self::convertToAbsolutePaths($value);
        continue;
      }

      $pdata[$field->name] = $field->type->sleepValue($page, $field, $value);
    }

    return $pdata;
  }

  public static function getPages($pages, $flag = false) {
    $array = [];
    foreach ($pages as $p) {
      $p->of(true);
      $item = new \StdClass();
      $item->meta = self::getMetadata($p);
      $item->fields = self::getFields($p, $flag);
      $item->parent = self::getMetadata($p->parent);
      array_push($array, $item);
    }
    return $array;
  }

  public static function getPageReferences($pages) {
    $array = [];
    if (!$pages) return $array;
    foreach ($pages as $p) {
      $p->of(true);
      $item = new \StdClass();
      $item->meta = self::getMetadata($p);
      $item->fields = [
        'title' => $p->title
      ];
      array_push($array, $item);
    }
    return $array;
  }

  // TODO: check if multiple items or single
  public static function getSelectOptions($field) {
    return [
      'id' => $field->id,
      'title' => $field->title,
      'value' => $field->value
    ];
  }

  public static function getFile($field) {
    $array = [];
    if (!$field) return $array;
    foreach ($field as $p) {
      $item = new \StdClass();
      $item->ext = $p->ext;
      $item->description = $p->description;
      $item->url = $p->httpUrl;
      array_push($array, $item);
    }
    return $array;
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
