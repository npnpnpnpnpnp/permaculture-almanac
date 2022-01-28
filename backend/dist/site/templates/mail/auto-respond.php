<?php namespace ProcessWire; ?>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title><?php echo $title; ?></title>
    <style>
      body {
        font-family: sans-serif;
      }

      a {
        color: inherit;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <?php echo $body; ?>

    <p>
      Anna Sieg<br />
      <?php echo __('Geschäftsführerin'); ?><br />
      Stiftung für wissenschaftliche Forschung am Stadtspital Triemli<br />
      Birmensdorferstrasse 497<br />
      8063 Zürich<br />
      <a href="tel:0041444160025">+41 44 416 00 25</a><br />
      <a href="mailto:stiftung@triemli.zuerich.ch">stiftung@triemli.zuerich.ch</a>
    </p>
  </body>
</html>
