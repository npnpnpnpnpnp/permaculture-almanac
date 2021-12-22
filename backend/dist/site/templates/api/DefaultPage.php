<?php namespace ProcessWire;

class DefaultPage {
  public static function get($data) {
    Helper::setLanguage();

    if (isset($data->path)) {
      $data = AppApiHelper::checkAndSanitizeRequiredParameters($data, ['path|pagePathNameUTF8']);
      $page = wire('pages')->findOne('/' . $data->path);
    } else {
      $page = wire('pages')->get(1);
    }

    if (!($page && $page->id)) throw new AppApiException("Page not found", 404);

    $page->of(true);

    $response = new \StdClass();
    $response->meta = Helper::getMetadata($page);
    $response->fields = Helper::getFields($page);

    // Include children for the following templates
    $includeChildren = ['resources'];
    if (in_array($page->template->name, $includeChildren)) {
      $response->children = Helper::getPages($page->children);
    }

    // if we are on template resource..
    if ($page->template->name == 'resources') {
    // get all tags from template tags..
      $tags = wire('pages')->get('template=tags')->children;
      //and check if they are used somewhere in the app as a reference
      $usedTags = new PageArray();
       foreach($tags as $tag) {
        $references = $tag->references();
        // if there are no tags, continue
        if (!$references->count) continue;
        //if not, push them to usedTags-array. has to be page array to have other meothds available
        $usedTags->add($tag);
      }
      // then, add them to the tags field of the response when fetching resources page
      $response->tags = Helper::getPageReferences($usedTags);
    }

    // if we are on template resource..
    if ($page->template->name == 'resources') {
    // get all author from template authors..
      $authors = wire('pages')->get('template=authors')->children;
      //and check if they are used somewhere in the app as a reference
      $usedAuthors = new PageArray();
       foreach($authors as $author) {
        $references = $author->references();
        // if there are no tags, continue
        if (!$references->count) continue;
        //if not, push them to usedAuthor-array. has to be page array to have other meothds available
        $usedAuthors->add($author);
      }
      // then, add them to the tags field of the response when fetching resources page
      $response->authors = Helper::getPageReferences($usedAuthors);
    }

    Helper::unsetLanguage();
    return $response;
  }
}
