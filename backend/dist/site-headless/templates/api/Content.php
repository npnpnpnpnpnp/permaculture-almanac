<?php namespace ProcessWire;

require_once __DIR__ . '/Helper.php';
require_once __DIR__ . '/Images.php';

class Content {
  public static function get($fieldValue) {
    $content = [];

    foreach ($fieldValue as $contentItem) {
      $item = new \StdClass();
      $item->type = $contentItem->type;

      if ($contentItem->type === 'section') {
        $item->title = $contentItem->title;
      }

      if ($contentItem->type === 'body') {
        $body = $contentItem->body;
        $item->body = Helper::convertToAbsolutePaths($contentItem->body);
      }

      if ($contentItem->type === 'images') {
        $item->images = Images::get($contentItem->images);
      }

      if ($contentItem->type === 'video') {
        //$item->media_id = $contentItem->media_id;
      }

      array_push($content, $item);
    }

    return $content;
  }
}
