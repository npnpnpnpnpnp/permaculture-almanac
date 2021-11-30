<?php namespace ProcessWire;

require_once __DIR__ . '/Helper.php';
require_once __DIR__ . '/Images.php';

class RepeaterMatrix {
  public static function get($fieldValue) {
    $matrix = [];

    foreach ($fieldValue as $matrixItem) {
      $item = new \StdClass();
      $item->type = $matrixItem->type;

      if ($matrixItem->type === 'type_video') {
        $item->title = $matrixItem->title;
        $item->author = Helper::getPageReferences($matrixItem->author);
        $item->url = $matrixItem->external_url;
        $item->host = Helper::getPageReferences($matrixItem->host);
      }

      if ($matrixItem->type === 'type_publication') {
        $item->title = $matrixItem->title;
        $item->author = Helper::getPageReferences($matrixItem->author);
        $item->publisher = $matrixItem->publisher;
        $item->isbn = $matrixItem->isbn;
        $item->url = $matrixItem->external_url;
      }

      if ($matrixItem->type === 'type_person') {
        $item->author = Helper::getPageReferences($matrixItem->author);
        $item->url = $matrixItem->external_url;
      }

      if ($matrixItem->type === 'type_podcast') {
        $item->title = $matrixItem->title;
        $item->author = Helper::getPageReferences($matrixItem->author);
        $item->url = $matrixItem->external_url;
      }

      if ($matrixItem->type === 'institution') {
        $item->title = $matrixItem->title;
        $body = $matrixItem->body;
        if (!$body) continue;
        $item->body = Helper::convertToAbsolutePaths($body);
        $item->url = $matrixItem->external_url;
      }

      // if ($matrixItem->type === 'type_body') {
      //   $body = $matrixItem->body;
      //   if (!$body) continue;
      //   $item->body = Helper::convertToAbsolutePaths($body);
      // }

      // if ($matrixItem->type === 'type_images') {
      //   $images = $matrixItem->images;
      //   if (!$images->count) continue;
      //   $item->images = Images::get($images);
      // }

      // if ($matrixItem->type === 'type_image') {
      //   $image = $matrixItem->image;
      //   if (!$image->count) continue;
      //   $item->image = Images::get($image->first);
      // }

      // if ($matrixItem->type === 'type_list') {
      //   $list = $matrixItem->list;
      //   if (!$list->count) continue;
      //   $item->body = Helper::getRepeater($list);
      // }


      array_push($matrix, $item);
    }

    return $matrix;
  }
}
