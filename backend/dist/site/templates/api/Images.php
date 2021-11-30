<?php namespace ProcessWire;

require_once __DIR__ . '/Image.php';

class Images {
  public static function get($images) {
    if ($images instanceof Pageimages && $images->count) {
      $response = [];
      foreach ($images as $imageItem) {
        $image = Image::get($imageItem);
        array_push($response, $image);
      }
      return $response;
    } else if ($images && $images instanceof Pageimage) {
      return Image::get($images);
    }
  }
}
