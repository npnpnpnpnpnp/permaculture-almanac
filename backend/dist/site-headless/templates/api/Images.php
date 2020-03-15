<?php namespace ProcessWire;

require_once __DIR__ . '/Image.php';

class Images {
  public static function get($images) {
    if (!$images) return null;

    $response = [];

    foreach ($images as $imageItem) {
      $image = Image::get($imageItem, $widths);
      array_push($response, $image);
    }

    return $response;
  }
}
