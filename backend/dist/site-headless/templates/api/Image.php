<?php namespace ProcessWire;

class Image {
  public static function get ($image, $widths) {
    $widths = isset($widths) ? $widths : [200, 400, 800, 1200, 1600, 2000];

    $response = new \StdClass();
    $response->urls = [];
    $response->description = $image->description;
    $response->ext = $image->ext;
    $response->ratio = number_format(($image->width / $image->height), 3, '.', '');

    if ($image->ext == 'svg') {
      $url = new \StdClass();
      $url->url = $image->httpUrl;
      // $url->width = $resizedImage->width;
      array_push($response->urls, $url);
    } else {
      foreach ($widths as $width) {
        $resizedImage = $image->width($width);
        $url = new \StdClass();
        $url->url = $resizedImage->httpUrl;
        $url->width = $resizedImage->width;
        array_push($response->urls, $url);
      }
    }

    return $response;
  }
}
