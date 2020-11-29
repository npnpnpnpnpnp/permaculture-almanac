<?php namespace ProcessWire;

require_once __DIR__ . '/Image.php';

class Images {
  public static function get($images) {
    if (!$images) return null;

    if (is_array($images)) {
      $response = [];
      foreach ($images as $imageItem) {
        $image = Image::get($imageItem);
        array_push($response, $image);
      }
      return $response;
    } else {
      return Image::get($images);
    }
  }
}
