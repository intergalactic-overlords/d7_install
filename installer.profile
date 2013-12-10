<?php

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function installer_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  $form['site_information']['site_mail']['#default_value'] = ini_get('sendmail_from') ? ini_get('sendmail_from') : 'test@test.test';
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['admin_account']['account']['mail']['#default_value'] = 'test@test.test';

  // Set the timezone and country to Belgium
  $form['server_settings']['site_default_country']['#default_value'] = 'BE';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'Europe/Brussels';
}

function installer_js_alter(&$javascript) {
  // Remove automatic timezone detection.
  unset($javascript['misc/timezone.js']);
}