<?php namespace ProcessWire;

class Image {
  public static function get ($image, $widths = [400, 800, 1200]) {
    $response = new \StdClass();
    $response->urls = [];
    $response->description = $image->description;
    $response->ext = $image->ext;
    $response->ratio = number_format(($image->width / $image->height), 3, '.', '');

    foreach ($widths as $width) {
      $resizedImage = $image->width($width);
      $url = new \StdClass();
      $url->url = $resizedImage->httpUrl;
      $url->width = $resizedImage->width;
      array_push($response->urls, $url);
    }

    return $response;
  }
}
