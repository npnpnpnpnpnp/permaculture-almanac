<?php namespace ProcessWire;

require_once __DIR__ . '/Image.php';

class Images {
  // TODO: Why do I have to set default value for widths here?
  public static function get($images, $widths = [200, 400, 800, 1200, 1600, 2000]) {
    if (!$images) return null;

    $response = [];

    foreach ($images as $imageItem) {
      $image = Image::get($imageItem, $widths);
      array_push($response, $image);
    }

    return $response;
  }
}
