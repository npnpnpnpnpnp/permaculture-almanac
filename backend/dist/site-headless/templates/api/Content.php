<?php namespace ProcessWire;

require_once __DIR__ . '/Helper.php';
require_once __DIR__ . '/Images.php';

class Content {
  public static function get($fieldValue) {
    $content = [];

    foreach ($fieldValue as $contentItem) {
      $item = new \StdClass();
      $item->type = $contentItem->type;

      if ($contentItem->type === 'type_section') {
        $title = $contentItem->title;
        if (!$title) continue;
        $item->title = $title;
      }

      if ($contentItem->type === 'type_body') {
        $body = $contentItem->body;
        if (!$body) continue;
        $item->body = Helper::convertToAbsolutePaths($contentItem->body);
      }

      if ($contentItem->type === 'type_images') {
        $images = $contentItem->images;
        if (!$images->count) continue;
        $item->images = Images::get($images);
      }

      if ($contentItem->type === 'type_video') {
        // $mediaId = $contentItem->media_id;
        // if (!$mediaId) continue;
        //$item->mediaId = $media_id;
      }

      array_push($content, $item);
    }

    return $content;
  }
}
