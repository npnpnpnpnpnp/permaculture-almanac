<?php namespace ProcessWire; ?>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title><?php echo $title; ?></title>
  </head>
  <body>
    <p><?php echo $body; ?></p>

    <?php if (isset($form)): ?>
      <table style='width: 100%; border-bottom: 1px solid #ccc;' cellspacing='0'>
        <?php foreach($form as $key => $value): ?>
          <tr>
            <th class='label' style='width: 30%; text-align: right; font-weight: bold; padding: 10px 10px 10px 0; vertical-align: top; border-top: 1px solid #ccc;'>
              <?php echo $key; ?>
            </th>
            <td class='value' style='width: 70%; padding: 10px 0 10px 0; border-top: 1px solid #ccc;'>
              <?php echo $value; ?>
            </td>
          </tr>
        <?php endforeach; ?>
      </table>
    <?php endif; ?>
  </body>
</html>