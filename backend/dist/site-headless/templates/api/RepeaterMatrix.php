<?php namespace ProcessWire;

require_once __DIR__ . '/Helper.php';
require_once __DIR__ . '/Images.php';

class RepeaterMatrix {
  public static function get($fieldValue) {
    $matrix = [];

    foreach ($fieldValue as $matrixItem) {
      $item = new \StdClass();
      $item->type = $matrixItem->type;

      // if ($matrixItem->type === 'type_section') {
      //   $title = $matrixItem->title;
      //   if (!$title) continue;
      //   $item->title = $title;
      // }

      if ($matrixItem->type === 'type_body') {
        $body = $matrixItem->body;
        if (!$body) continue;
        $item->body = Helper::convertToAbsolutePaths($body);
      }

      if ($matrixItem->type === 'type_images') {
        $images = $matrixItem->images;
        if (!$images->count) continue;
        $item->images = Images::get($images);
      }

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

      // if ($matrixItem->type === 'type_video') {
      //   $mediaId = $matrixItem->media_id;
      //   if (!$mediaId) continue;
      //   $item->mediaId = $media_id;
      // }

      array_push($matrix, $item);
    }

    return $matrix;
  }
}
