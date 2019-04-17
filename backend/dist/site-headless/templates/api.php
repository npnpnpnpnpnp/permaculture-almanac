<?php namespace ProcessWire;

// Pre-check for unwanted symbols (hint from Ryan)
if (strpos($input->urlSegmentStr(), '.') !== false) {
    throw new Wire404Exception();
}

// Build request URL
$protocol = $input->scheme() . "://";
$endpoint = $modules->get("RestApi")->endpoint;
$hostname = $config->httpHost;
$url =  $protocol.$hostname."/".$endpoint."/".$input->urlSegmentStr();

// This bit slows the traffic down a bit, but seems more secure
$http = new WireHttp();
$status = $http->status($url);
if ($status === 200) {
  return $http->get($url);
}

// Prevent the creation of empty caches:
throw new Wire404Exception();
