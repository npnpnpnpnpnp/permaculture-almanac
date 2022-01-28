<?php namespace ProcessWire;

require_once __DIR__ . "/Helper.php";

class DonationForm {
  public static function submitForm($data) {
    Helper::setLanguage();

    // Sanitize form fields
    $form = [];
    $email = $form['email'] = wire('sanitizer')->email($data->email);
    // if (isset($data->donationPurpose)) $form['donationPurpose'] = wire('sanitizer')->text($data->donationPurpose);
    // if (isset($data->payment)) $form['payment'] = wire('sanitizer')->text($data->payment);
    // if (isset($data->salutation)) $form['salutation'] = wire('sanitizer')->text($data->salutation);
    if (isset($data->title)) $form['title'] = wire('sanitizer')->text($data->title);
    // if (isset($data->firstName)) $form['firstName'] = wire('sanitizer')->text($data->firstName);
    // if (isset($data->lastName)) $form['lastName'] = wire('sanitizer')->text($data->lastName);
    // if (isset($data->organisation)) $form['organisation'] = wire('sanitizer')->text($data->organisation);
    // if (isset($data->street)) $form['street'] = wire('sanitizer')->text($data->street);
    // if (isset($data->additionalAddress)) $form['additionalAddress'] = wire('sanitizer')->text($data->additionalAddress);
    // if (isset($data->city)) $form['city'] = wire('sanitizer')->text($data->city);
    // if (isset($data->country)) $form['country'] = wire('sanitizer')->text($data->country);
    // if (isset($data->phone)) $form['phone'] = wire('sanitizer')->text($data->phone);
    // if (isset($data->comments)) $form['comments'] = wire('sanitizer')->text($data->comments);
    // if (isset($data->newsletter)) $form['newsletter'] = wire('sanitizer')->text($data->newsletter);
    // if (isset($data->donationReceipt)) $form['donationReceipt'] = wire('sanitizer')->text($data->donationReceipt);

    // Create page
    $p = new Page();
    $p->template = 'resource-submission';
    $p->parent = wire('pages')->get('template=resource-submissions');
    $date = \date('Y-m-d H:i:s');
    $title = $date . ' ' . $email;

    $p->name = wire('sanitizer')->pageNameTranslate($title);
    $p->title = $title;
    $p->email = $email;
    $p->request = serialize($form);

    $saved = $p->save();

    // Send mail
    if (wire('config')->_mailTo) {
      $mail = wireMail();
      $mail->to(wire('config')->_mailTo);
      $mail->from($email);
      $mail->subject('Permaculture Almanac: New resource submission');
      $bodyHTML = wireRenderFile(wire('config')->paths->templates . 'mail/default.php', array(
        'title' => 'New resource submission',
        'body' => "A new entry for the resourc elist on Permaculure Almanac was submitted by  $email.",
        'form' => $form
      ));
      $mail->bodyHTML($bodyHTML);
      $numSent = $mail->send();
      if ($numSent < 1) {
        wire('log')->save('mail', "Failed to send confirmation mail from $email");
      }

      // Send auto-response to user
      $autoRespond = wireMail();
      $autoRespond->to($email);
      $autoRespond->from(wire('config')->_mailFrom);
      $autoRespond->replyTo(wire('config')->_replyTo);
      $subject = __('Thanks for your submission!');
      $autoRespond->subject($subject);
      $body = __('Your entry submission was received. It will be reviewed asap.') . '<br /><br />' .
      $subject . '<br /><br />' .
      __('All the best');
      $bodyHTML = wireRenderFile(wire('config')->paths->templates . 'mail/auto-respond.php', array(
        'title' => $subject,
        'body' => $body
      ));
      $autoRespond->bodyHTML($bodyHTML);
      $numSent = $autoRespond->send();
      if ($numSent < 1) {
        wire('log')->save('mail', "Failed to send auto-response to $email");
      }
    }

    Helper::unsetLanguage();

    $response = $saved ? 'success' : 'error';
    return $response;
  }
}
