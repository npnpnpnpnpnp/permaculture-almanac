# --- WireDatabaseBackup {"time":"2019-11-11 08:49:11","user":"","dbName":"pw-vue-kickstart","description":"","tables":[],"excludeTables":["pages_drafts","pages_roles","permissions","roles","roles_permissions","users","users_roles","user","role","permission"],"excludeCreateTables":[],"excludeExportTables":["field_roles","field_permissions","field_email","field_pass","caches","session_login_throttle","page_path_history"]}

DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_admin_theme`;
CREATE TABLE `field_admin_theme` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_admin_theme` (`pages_id`, `data`) VALUES('41', '196');

DROP TABLE IF EXISTS `field_body`;
CREATE TABLE `field_body` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1042', '<p>Sample <a	href=\"/site/assets/files/test.pdf\">page</a> with <a	href=\"/\">internal link</a> to homepage.</p>');

DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_image`;
CREATE TABLE `field_image` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_images`;
CREATE TABLE `field_images` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_language`;
CREATE TABLE `field_language` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('40', '1013', '0');
INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('41', '1039', '0');

DROP TABLE IF EXISTS `field_language_files`;
CREATE TABLE `field_language_files` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpageclone-module.json', '134', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpageadd--processpageadd-module.json', '133', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processmodule--processmoduleinstall-php.json', '132', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processmodule--processmodule-module.json', '131', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processlogin--processlogin-module.json', '130', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processlogger--processlogger-module.json', '129', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processlist-module.json', '128', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processhome-module.json', '127', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processforgotpassword-module.json', '126', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processfield--processfieldexportimport-php.json', '125', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processfield--processfield-module.json', '124', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processcommentsmanager--processcommentsmanager-module.json', '123', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--pagerender-module.json', '122', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--pagepaths-module.json', '121', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--page--pagefrontedit--pagefronteditconfig-php.json', '120', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--page--pagefrontedit--pagefrontedit-module.json', '119', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--markup--markuppagernav--markuppagernav-module.json', '118', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--markup--markuppagefields-module.json', '117', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--languagesupport--processlanguage-module.json', '116', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--languagesupport--languagetranslator-php.json', '115', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--languagesupport--languagetabs-module.json', '114', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--languagesupport--languagesupportpagenames-module.json', '113', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--languagesupport--languagesupportinstall-php.json', '112', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--languagesupport--languagesupportfields-module.json', '111', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--languagesupport--languagesupport-module.json', '110', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--languagesupport--languageparser-php.json', '109', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--jquery--jquerywiretabs--jquerywiretabs-module.json', '108', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--jquery--jqueryui--jqueryui-module.json', '107', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldurl-module.json', '106', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldtext-module.json', '104', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldtextarea-module.json', '105', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldsubmit--inputfieldsubmit-module.json', '103', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldselector--inputfieldselector-module.json', '102', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldselectmultiple-module.json', '101', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldselect-module.json', '100', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldradios--inputfieldradios-module.json', '99', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldpassword--inputfieldpassword-module.json', '98', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagetitle--inputfieldpagetitle-module.json', '97', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagetable--inputfieldpagetableajax-php.json', '96', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagetable--inputfieldpagetable-module.json', '95', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagename--inputfieldpagename-module.json', '94', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagelistselect--inputfieldpagelistselectmultiple-module.json', '93', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagelistselect--inputfieldpagelistselect-module.json', '92', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldpageautocomplete--inputfieldpageautocomplete-module.json', '91', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldpage--inputfieldpage-module.json', '90', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldname-module.json', '89', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldmarkup-module.json', '88', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldinteger-module.json', '87', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldimage--inputfieldimage-module.json', '86', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldicon--inputfieldicon-module.json', '85', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldhidden-module.json', '84', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldform-module.json', '83', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldfloat-module.json', '82', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldfile--inputfieldfile-module.json', '81', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldfieldset-module.json', '80', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldemail-module.json', '79', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfielddatetime--inputfielddatetime-module.json', '78', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldckeditor--inputfieldckeditor-module.json', '77', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldcheckboxes--inputfieldcheckboxes-module.json', '76', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldcheckbox-module.json', '75', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldbutton-module.json', '74', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--inputfield--inputfieldasmselect--inputfieldasmselect-module.json', '73', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--image--imagesizerengineanimatedgif--imagesizerengineanimatedgif-module.json', '72', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--filecompilertags-module.json', '71', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeurl-module.json', '70', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypetextareahelper-php.json', '69', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypetext-module.json', '68', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeselector-module.json', '67', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--inputfieldrepeater-module.json', '66', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--fieldtyperepeater-module.json', '65', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--fieldtypefieldsetpage-module.json', '64', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--fieldsetpageinstructions-php.json', '63', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--config-php.json', '62', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypepagetable-module.json', '61', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypepage-module.json', '60', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeoptions--selectableoptionmanager-php.json', '59', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeoptions--selectableoptionconfig-php.json', '58', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeoptions--fieldtypeoptions-module.json', '57', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypemodule-module.json', '56', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeinteger-module.json', '55', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypefloat-module.json', '54', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypefile-module.json', '53', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypefieldsettabopen-module.json', '52', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypedatetime-module.json', '51', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--inputfieldcommentsadmin-module.json', '50', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--fieldtypecomments-module.json', '49', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentstars-php.json', '48', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentnotifications-php.json', '47', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentlist-php.json', '46', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentform-php.json', '45', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentfilterakismet-module.json', '44', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--config-php.json', '43', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--adminthemeuikit-module.json', '42', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--_sidenav-masthead-php.json', '41', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--_masthead-php.json', '40', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--_footer-php.json', '39', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemereno--default-php.json', '38', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemereno--debug-inc.json', '37', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemereno--adminthemerenohelpers-php.json', '36', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemereno--adminthemereno-module.json', '35', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--admintheme--adminthemedefault--adminthemedefault-module.json', '34', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--wireupload-php.json', '33', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--wireshutdown-php.json', '32', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--wirehttp-php.json', '31', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--wiredatetime-php.json', '30', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--wirecache-php.json', '29', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--sessioncsrf-php.json', '28', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--session-php.json', '27', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--process-php.json', '25', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--sanitizer-php.json', '26', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--permissions-php.json', '24', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--password-php.json', '23', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--paginatedarray-php.json', '22', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--pagesexportimport-php.json', '21', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--pageseditor-php.json', '20', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--pageimage-php.json', '19', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--modulesduplicates-php.json', '18', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--modules-php.json', '17', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--markupqa-php.json', '16', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--inputfieldwrapper-php.json', '15', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--inputfield-php.json', '14', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--imagesizerengine-php.json', '13', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--functions-php.json', '12', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--filevalidatormodule-php.json', '11', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--filecompilermodule-php.json', '10', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--filecompiler-php.json', '9', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--fieldtype-php.json', '7', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--fieldtypemulti-php.json', '8', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--fieldselectorinfo-php.json', '6', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--fields-php.json', '5', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--fieldgroups-php.json', '4', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--adminthemeframework-php.json', '2', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--field-php.json', '3', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--admintheme-php.json', '1', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--core--admin-php.json', '0', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpageedit--pagebookmarks-php.json', '135', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpageedit--processpageedit-module.json', '136', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpageeditimageselect--processpageeditimageselect-module.json', '137', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpageeditlink--processpageeditlink-module.json', '138', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagelist--processpagelist-module.json', '139', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagelist--processpagelistactions-php.json', '140', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagelist--processpagelistrender-php.json', '141', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagelist--processpagelistrenderjson-php.json', '142', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagelister--processpagelister-module.json', '143', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagelister--processpagelisterbookmarks-php.json', '144', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagesearch--processpagesearch-module.json', '145', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagesexportimport--processpagesexportimport-module.json', '146', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagesort-module.json', '147', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagetrash-module.json', '148', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpagetype--processpagetype-module.json', '149', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpageview-module.json', '150', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processpermission--processpermission-module.json', '151', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processprofile--processprofile-module.json', '152', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processrecentpages--processrecentpages-module.json', '153', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processrole--processrole-module.json', '154', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processtemplate--processtemplate-module.json', '155', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processtemplate--processtemplateexportimport-php.json', '156', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processuser--processuser-module.json', '157', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--process--processuser--processuserconfig-php.json', '158', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--session--sessionhandlerdb--processsessiondb-module.json', '159', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--session--sessionhandlerdb--sessionhandlerdb-module.json', '160', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--session--sessionloginthrottle--sessionloginthrottle-module.json', '161', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--system--systemnotifications--systemnotifications-module.json', '162', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--system--systemnotifications--systemnotificationsconfig-php.json', '163', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--system--systemupdater--systemupdater-module.json', '164', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--textformatter--textformatterentities-module.json', '165', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--textformatter--textformattermarkdownextra--textformattermarkdownextra-module.json', '166', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--modules--textformatter--textformattersmartypants--textformattersmartypants-module.json', '167', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--templates-admin--debug-inc.json', '168', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1013', 'wire--templates-admin--default-php.json', '169', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '');

DROP TABLE IF EXISTS `field_language_files_site`;
CREATE TABLE `field_language_files_site` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_meta_description`;
CREATE TABLE `field_meta_description` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_pass`;
CREATE TABLE `field_pass` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_process`;
CREATE TABLE `field_process` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_process` (`pages_id`, `data`) VALUES('6', '17');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('3', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('8', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('9', '14');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('10', '7');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('11', '47');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('16', '48');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('300', '104');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('21', '50');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('29', '66');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('23', '10');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('304', '138');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('31', '136');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('22', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('30', '68');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('303', '129');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('2', '87');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('302', '121');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('301', '109');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('28', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1007', '150');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1010', '159');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1012', '161');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1014', '162');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1022', '177');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1045', '205');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1032', '186');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1037', '190');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_title` (`pages_id`, `data`) VALUES('11', 'Templates');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('16', 'Fields');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('22', 'Setup');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('3', 'Pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('6', 'Add Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('8', 'Tree');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('9', 'Save Sort');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('10', 'Edit');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('21', 'Modules');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('29', 'Users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('30', 'Roles');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('2', 'Admin');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('7', 'Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('27', 'Seite nicht gefunden');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('302', 'Insert Link');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('23', 'Login');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('304', 'Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('301', 'Empty Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('300', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('303', 'Insert Image');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('28', 'Access');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('31', 'Permissions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('32', 'Edit pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('34', 'Delete pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('35', 'Move pages (change parent)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('36', 'View pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('50', 'Sort child pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('51', 'Change templates on pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('52', 'Administer users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('53', 'User can update profile/password');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('54', 'Lock or unlock a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1006', 'Use Page Lister');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1007', 'Find');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1010', 'Recent');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1011', 'Can see recently edited pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1012', 'Languages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1013', 'German');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1014', 'Language Translator');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1022', 'Logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1023', 'Can view system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1024', 'Can manage system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1041', 'Nutzen Sie den Bild-Editor zum Bearbeiten von Bildern (zuschneiden, Größe ändern, usw.)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1032', 'DB Backups');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1033', 'Manage database backups (recommended for superuser only)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1037', 'Export Site Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1039', 'English');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1042', 'Hello World');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1044', 'API');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1045', 'ProCache');

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('99', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('97', 'language');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('98', 'http-status');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('100', 'api');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fields_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '2', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '99', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '98', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '97', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '101', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '101', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '102', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '105', '4', NULL);

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii NOT NULL,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Titel', '{\"required\":1,\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":255,\"label1039\":\"Title\",\"collapsed\":0,\"minlength\":0,\"showCount\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"permanent\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail Address', '{\"size\":70,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeFile', 'language_files_site', '24', 'Site Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for translations specific to your site (like files in \\/site\\/templates\\/ for example).\",\"descriptionRows\":0,\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('98', 'FieldtypeFile', 'language_files', '24', 'Core Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for [language packs](http:\\/\\/modules.processwire.com\\/categories\\/language-pack\\/). To delete all files, double-click the trash can for any file, then save.\",\"descriptionRows\":0,\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('99', 'FieldtypePage', 'language', '24', 'Language', '{\"derefAsPage\":1,\"parent_id\":1012,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldRadios\",\"required\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('101', 'FieldtypeTextarea', 'body', '0', 'Text', '{\"inputfieldClass\":\"InputfieldCKEditor\",\"contentType\":1,\"rows\":5,\"toolbar\":\"Styles\\nRemoveFormat\\nBold, Italic\\nPWLink, Unlink\\nNumberedList, BulletedList\",\"inlineMode\":1,\"useACF\":1,\"usePurifier\":1,\"toggles\":[2,4],\"formatTags\":\"p;h1;h2;h3;h4;h5;h6;pre;address\",\"extraPlugins\":[\"pwlink\"],\"removePlugins\":\"image,magicline\",\"collapsed\":0,\"label1039\":\"Body\",\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"contentsInlineCss\":\"\\/site\\/modules\\/InputfieldCKEditor\\/contents-inline_custom.css\",\"stylesSet\":\"mystyles_custom:\\/site\\/modules\\/InputfieldCKEditor\\/mystyles_custom.js\",\"imageFields\":[\"x\"]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('102', 'FieldtypeText', 'meta_description', '0', 'Meta description', '{\"description\":\"Zusammenfassung des Seiteninhalts f\\u00fcr Suchmaschinen\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":2,\"size\":0,\"maxlength\":155,\"minlength\":0,\"showCount\":1,\"description1039\":\"Abstract of page content for search engines\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('103', 'FieldtypeImage', 'image', '0', 'Bild', '{\"textformatters\":[\"TextformatterEntities\"],\"extensions\":\"jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":1,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"overwrite\":1,\"descriptionRows\":1,\"gridMode\":\"left\",\"maxReject\":0,\"fileSchema\":6,\"label1039\":\"Image\",\"dimensionsByAspectRatio\":0,\"useTags\":0,\"focusMode\":\"off\",\"resizeServer\":0,\"clientQuality\":90,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('104', 'FieldtypeImage', 'images', '0', 'Bilder', '{\"textformatters\":[\"TextformatterEntities\"],\"extensions\":\"jpg jpeg png svg\",\"maxFiles\":0,\"outputFormat\":1,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"descriptionRows\":1,\"gridMode\":\"left\",\"maxReject\":0,\"fileSchema\":6,\"label1039\":\"Images\",\"dimensionsByAspectRatio\":0,\"useTags\":0,\"focusMode\":\"off\",\"resizeServer\":0,\"clientQuality\":90,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('105', 'FieldtypeModule', 'admin_theme', '8', 'Admin Theme', '{\"moduleTypes\":[\"AdminTheme\"],\"labelField\":\"title\",\"inputfieldClass\":\"InputfieldRadios\"}');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('2', 'FieldtypeNumber', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '3', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('30', 'InputfieldForm', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('6', 'FieldtypeFile', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('7', 'ProcessPageEdit', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('10', 'ProcessLogin', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('12', 'ProcessPageList', '0', '{\"pageLabelField\":\"title\",\"paginationLimit\":25,\"limit\":50}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('14', 'ProcessPageSort', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('15', 'InputfieldPageListSelect', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('117', 'JqueryUI', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('17', 'ProcessPageAdd', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('125', 'SessionLoginThrottle', '11', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('122', 'InputfieldPassword', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('25', 'InputfieldAsmSelect', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('116', 'JqueryCore', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('27', 'FieldtypeModule', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('28', 'FieldtypeDatetime', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('29', 'FieldtypeEmail', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('108', 'InputfieldURL', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('32', 'InputfieldSubmit', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('33', 'InputfieldWrapper', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('34', 'InputfieldText', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('35', 'InputfieldTextarea', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('36', 'InputfieldSelect', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('37', 'InputfieldCheckbox', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('38', 'InputfieldCheckboxes', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('39', 'InputfieldRadios', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('40', 'InputfieldHidden', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('41', 'InputfieldName', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('43', 'InputfieldSelectMultiple', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('45', 'JqueryWireTabs', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('46', 'ProcessPage', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('47', 'ProcessTemplate', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('48', 'ProcessField', '32', '{\"collapsedTags\":[]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('50', 'ProcessModule', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('114', 'PagePermissions', '3', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('97', 'FieldtypeCheckbox', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('115', 'PageRender', '3', '{\"clearCache\":1}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('55', 'InputfieldFile', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('56', 'InputfieldImage', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('57', 'FieldtypeImage', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('60', 'InputfieldPage', '0', '{\"inputfieldClasses\":[\"InputfieldSelect\",\"InputfieldSelectMultiple\",\"InputfieldCheckboxes\",\"InputfieldRadios\",\"InputfieldAsmSelect\",\"InputfieldPageListSelect\",\"InputfieldPageListSelectMultiple\",\"InputfieldPageAutocomplete\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('61', 'TextformatterEntities', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('66', 'ProcessUser', '0', '{\"showFields\":[\"name\",\"email\",\"roles\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('67', 'MarkupAdminDataTable', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('68', 'ProcessRole', '0', '{\"showFields\":[\"name\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('76', 'ProcessList', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('78', 'InputfieldFieldset', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('79', 'InputfieldMarkup', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('80', 'InputfieldEmail', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('89', 'FieldtypeFloat', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('83', 'ProcessPageView', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('84', 'FieldtypeInteger', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('85', 'InputfieldInteger', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('86', 'InputfieldPageName', '0', '{\"replacements\":{\"\\u00e6\":\"ae\",\"\\u00e5\":\"a\",\"\\u00e4\":\"ae\",\"\\u00df\":\"ss\",\"\\u00f6\":\"oe\",\"\\u00fc\":\"ue\",\"\\u0111\":\"dj\",\"\\u0436\":\"zh\",\"\\u0445\":\"kh\",\"\\u0446\":\"tc\",\"\\u0447\":\"ch\",\"\\u0448\":\"sh\",\"\\u0449\":\"shch\",\"\\u044e\":\"iu\",\"\\u044f\":\"ia\",\":\":\"-\",\",\":\"-\",\"\\u00e0\":\"a\",\"\\u00e1\":\"a\",\"\\u00e2\":\"a\",\"\\u00e8\":\"e\",\"\\u00e9\":\"e\",\"\\u00eb\":\"e\",\"\\u00ea\":\"e\",\"\\u011b\":\"e\",\"\\u00ec\":\"i\",\"\\u00ed\":\"i\",\"\\u00ef\":\"i\",\"\\u00ee\":\"i\",\"\\u00f5\":\"o\",\"\\u00f2\":\"o\",\"\\u00f3\":\"o\",\"\\u00f4\":\"o\",\"\\u00f8\":\"o\",\"\\u00f9\":\"u\",\"\\u00fa\":\"u\",\"\\u00fb\":\"u\",\"\\u016f\":\"u\",\"\\u00f1\":\"n\",\"\\u00e7\":\"c\",\"\\u010d\":\"c\",\"\\u0107\":\"c\",\"\\u010f\":\"d\",\"\\u013a\":\"l\",\"\\u013e\":\"l\",\"\\u0144\":\"n\",\"\\u0148\":\"n\",\"\\u0155\":\"r\",\"\\u0159\":\"r\",\"\\u0161\":\"s\",\"\\u0165\":\"t\",\"\\u00fd\":\"y\",\"\\u017e\":\"z\",\"\\u0430\":\"a\",\"\\u0431\":\"b\",\"\\u0432\":\"v\",\"\\u0433\":\"g\",\"\\u0434\":\"d\",\"\\u0435\":\"e\",\"\\u0451\":\"e\",\"\\u0437\":\"z\",\"\\u0438\":\"i\",\"\\u0439\":\"i\",\"\\u043a\":\"k\",\"\\u043b\":\"l\",\"\\u043c\":\"m\",\"\\u043d\":\"n\",\"\\u043e\":\"o\",\"\\u043f\":\"p\",\"\\u0440\":\"r\",\"\\u0441\":\"s\",\"\\u0442\":\"t\",\"\\u0443\":\"u\",\"\\u0444\":\"f\",\"\\u044b\":\"y\",\"\\u044d\":\"e\",\"\\u0119\":\"e\",\"\\u0105\":\"a\",\"\\u015b\":\"s\",\"\\u0142\":\"l\",\"\\u017c\":\"z\",\"\\u017a\":\"z\"}}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('87', 'ProcessHome', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('90', 'InputfieldFloat', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('94', 'InputfieldDatetime', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('98', 'MarkupPagerNav', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('129', 'ProcessPageEditImageSelect', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('103', 'JqueryTableSorter', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('104', 'ProcessPageSearch', '1', '{\"searchFields\":\"title\",\"displayField\":\"title path\"}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('105', 'FieldtypeFieldsetOpen', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('106', 'FieldtypeFieldsetClose', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('107', 'FieldtypeFieldsetTabOpen', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('109', 'ProcessPageTrash', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('111', 'FieldtypePageTitle', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('112', 'InputfieldPageTitle', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('113', 'MarkupPageArray', '3', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('131', 'InputfieldButton', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('133', 'FieldtypePassword', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('134', 'ProcessPageType', '33', '{\"showFields\":[]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('135', 'FieldtypeURL', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('136', 'ProcessPermission', '1', '{\"showFields\":[\"name\",\"title\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('137', 'InputfieldPageListSelectMultiple', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('138', 'ProcessProfile', '1', '{\"profileFields\":[\"pass\",\"email\",\"language\",\"admin_theme\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":16,\"coreVersion\":\"3.0.123\"}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('148', 'AdminThemeDefault', '10', '{\"colors\":\"classic\"}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('149', 'InputfieldSelector', '42', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('150', 'ProcessPageLister', '32', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('151', 'JqueryMagnific', '1', '', '2014-07-21 07:21:45');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('155', 'InputfieldCKEditor', '0', '', '2014-07-25 10:26:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('156', 'MarkupHTMLPurifier', '0', '', '2014-07-25 10:26:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('159', 'ProcessRecentPages', '1', '', '2015-03-10 22:20:16');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('160', 'LanguageSupport', '35', '{\"languagesPageID\":1012,\"defaultLanguagePageID\":1013,\"otherLanguagePageIDs\":[1039],\"languageTranslatorPageID\":1014}', '2015-03-10 22:22:48');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('161', 'ProcessLanguage', '1', '', '2015-03-10 22:22:48');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('162', 'ProcessLanguageTranslator', '1', '', '2015-03-10 22:22:48');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('201', 'RestApi', '3', '{\"authMethod\":\"none\",\"jwtSecret\":\"5UErooZgjtxKHdlorkUSxH\\/f2eFz6ItFU56ROObNXwfL8Uk9ZG9RFIAN13oycur6MPOYfrad21BilSIYFREmbO7uqTgqSKPsGn\\/C7pAswwrN6m1h5bas6MZPCRGIU18qFKPJYdlQ+6Mvn0MYWF+6lLxpo3Gcp0meVcvokGrqsKE=\",\"endpoint\":\"live-api\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2019-03-08 16:53:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('202', 'InputfieldPageAutocomplete', '0', '', '2019-03-15 17:37:32');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('204', 'ProCache', '3', '{\"licenseKey\":\"PWPC3.per2284.af9b22291fe60c0807c9824f91cd3452daa1c1c5\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\",\"cacheOn\":true,\"debug\":\"0\",\"cacheTime\":31449600,\"cacheTimeCustom\":\"\",\"cacheClear\":[4],\"cacheClearCustom\":\"\",\"htAllow\":\"1\",\"minifyTemplates\":[],\"minifyIgnoreTags\":\"textarea pre\",\"minifyBlocks\":\"!doctype address article aside audio blockquote body br button canvas caption col colgroup dd div dl dt embed fieldset figcaption figure footer form h1 h2 h3 h4 h5 h6 head header hgroup hr html li link main map meta nav noscript object ol optgroup option output p pre progress script section table tbody td tfoot th thead title tr ul video\",\"minifyRemoveBlankAttr\":\"class dir for id lang style title\",\"minifyOptions\":[],\"minifyHTMLOptions\":[\"js\",\"css\",\"uncomment\",\"noXHTML\",\"unblank\",\"untag\",\"unattr\",\"unbool\",\"unquote\"],\"minifyMaxImportCSS\":5,\"noCacheCookies\":\"wire_challenge\\nwires_challenge\",\"noCacheGetVars\":\"*\",\"urlSegments\":\"4\",\"https\":\"\",\"cacheHosts\":[],\"bodyClass\":\"\",\"canonical\":\"0\",\"docRootPath\":\"\",\"busterUrlType\":\"qstr\",\"cdnHosts\":\"\",\"cdnExts\":\"\",\"cdnAttrs\":\"src srcset href\",\"cdnTemplates\":[],\"cdnStatus\":\"0\",\"cacheTemplates\":[46]}', '2019-04-17 09:50:52');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('205', 'ProcessProCache', '1', '', '2019-04-17 09:50:52');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('172', 'MarkupCache', '3', '', '2015-03-11 09:12:57');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('173', 'MaintenanceMode', '3', '{\"inMaintenance\":\"\",\"bypassRoles\":[],\"showPage\":1019,\"showURL\":\"\",\"allowPages\":[]}', '2015-03-11 09:13:11');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('177', 'ProcessLogger', '1', '', '2015-06-18 22:06:16');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('178', 'InputfieldIcon', '0', '', '2015-06-18 22:06:16');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('186', 'ProcessDatabaseBackups', '0', '', '2015-06-23 15:52:38');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('196', 'AdminThemeUikit', '10', '{\"useAsLogin\":1,\"userAvatar\":\"icon.user-circle\",\"userLabel\":\"{Name}\",\"logoAction\":\"0\",\"layout\":\"\",\"maxWidth\":1600,\"groupNotices\":\"1\",\"cssURL\":\"\",\"logoURL\":\"\",\"noBorderTypes\":[],\"offsetTypes\":[]}', '2018-04-05 07:59:25');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('197', 'ImageSizerEngineIMagick', '0', '', '2018-04-05 08:00:28');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('198', 'ImageSizerEngineAnimatedGif', '0', '', '2018-04-05 08:00:35');

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `templates_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET ascii NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `published` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_parent_id` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `templates_id` (`templates_id`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `status` (`status`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=1047 DEFAULT CHARSET=utf8;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2019-09-25 11:11:18', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'manage', '1035', '2016-10-24 16:25:12', '40', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2011-03-29 21:37:06', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2015-11-02 15:57:07', '40', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2011-08-14 22:04:52', '41', '2010-02-07 05:29:39', '2', '2010-02-07 05:29:39', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2018-04-05 07:57:22', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2011-03-29 21:37:06', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2015-12-15 15:04:30', '40', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2011-03-29 21:37:06', '41', '2010-02-01 11:04:54', '2', '2010-02-01 11:04:54', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2011-03-29 21:37:06', '41', '2010-02-01 12:44:07', '2', '2010-02-01 12:44:07', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2011-03-29 21:37:06', '41', '2010-02-02 10:02:24', '2', '2010-02-02 10:02:24', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2011-03-29 21:37:06', '41', '2010-02-09 12:16:59', '2', '2010-02-09 12:16:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2011-05-03 23:38:10', '41', '2010-02-17 09:59:39', '2', '2010-02-17 09:59:39', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '44', '404', '1035', '2019-03-08 17:01:57', '41', '2010-06-03 06:53:03', '3', '2010-06-03 06:53:03', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('28', '2', '2', 'access', '13', '2011-05-03 23:38:10', '41', '2011-03-19 19:14:20', '2', '2011-03-19 19:14:20', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('29', '28', '2', 'users', '29', '2011-04-05 00:39:08', '41', '2011-03-19 19:15:29', '2', '2011-03-19 19:15:29', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('30', '28', '2', 'roles', '29', '2011-04-05 00:38:39', '41', '2011-03-19 19:15:45', '2', '2011-03-19 19:15:45', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('31', '28', '2', 'permissions', '29', '2011-04-05 00:53:52', '41', '2011-03-19 19:16:00', '2', '2011-03-19 19:16:00', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('32', '31', '5', 'page-edit', '25', '2011-09-06 15:34:24', '41', '2011-03-19 19:17:03', '2', '2011-03-19 19:17:03', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('34', '31', '5', 'page-delete', '25', '2011-09-06 15:34:33', '41', '2011-03-19 19:17:23', '2', '2011-03-19 19:17:23', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('35', '31', '5', 'page-move', '25', '2011-09-06 15:34:48', '41', '2011-03-19 19:17:41', '2', '2011-03-19 19:17:41', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('36', '31', '5', 'page-view', '25', '2011-09-06 15:34:14', '41', '2011-03-19 19:17:57', '2', '2011-03-19 19:17:57', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('37', '30', '4', 'guest', '25', '2011-04-05 01:37:19', '41', '2011-03-19 19:18:41', '2', '2011-03-19 19:18:41', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('38', '30', '4', 'superuser', '25', '2011-08-17 14:34:39', '41', '2011-03-19 19:18:55', '2', '2011-03-19 19:18:55', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'admin', '1', '2018-04-05 07:59:47', '41', '2011-03-19 19:41:26', '2', '2011-03-19 19:41:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('40', '29', '3', 'guest', '25', '2015-03-10 22:22:48', '41', '2011-03-20 17:31:59', '2', '2011-03-20 17:31:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('50', '31', '5', 'page-sort', '25', '2011-09-06 15:34:58', '41', '2011-03-26 22:04:50', '41', '2011-03-26 22:04:50', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('51', '31', '5', 'page-template', '25', '2011-09-06 15:35:09', '41', '2011-03-26 22:25:31', '41', '2011-03-26 22:25:31', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('52', '31', '5', 'user-admin', '25', '2011-09-06 15:35:42', '41', '2011-03-30 00:06:47', '41', '2011-03-30 00:06:47', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('53', '31', '5', 'profile-edit', '1', '2011-08-16 22:32:48', '41', '2011-04-26 00:02:22', '41', '2011-04-26 00:02:22', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('54', '31', '5', 'page-lock', '1', '2011-08-15 17:48:12', '41', '2011-08-15 17:45:48', '41', '2011-08-15 17:45:48', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('300', '3', '2', 'search', '1045', '2011-03-29 21:37:06', '41', '2010-08-04 05:23:59', '2', '2010-08-04 05:23:59', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('301', '3', '2', 'trash', '1047', '2011-03-29 21:37:06', '41', '2010-09-28 05:39:30', '2', '2010-09-28 05:39:30', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('302', '3', '2', 'link', '1041', '2011-03-29 21:37:06', '41', '2010-10-01 05:03:56', '2', '2010-10-01 05:03:56', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('303', '3', '2', 'image', '1041', '2011-03-29 21:37:06', '41', '2010-10-13 03:56:48', '2', '2010-10-13 03:56:48', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('304', '2', '2', 'profile', '1025', '2011-05-03 23:38:10', '41', '2011-04-25 23:57:18', '41', '2011-04-25 23:57:18', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1006', '31', '5', 'page-lister', '1', '2014-07-20 09:00:38', '40', '2014-07-20 09:00:38', '40', '2014-07-20 09:00:38', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1007', '3', '2', 'lister', '1', '2014-07-20 09:00:38', '40', '2014-07-20 09:00:38', '40', '2014-07-20 09:00:38', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1010', '3', '2', 'recent-pages', '1', '2015-03-10 22:20:16', '40', '2015-03-10 22:20:16', '40', '2015-03-10 22:20:16', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1011', '31', '5', 'page-edit-recent', '1', '2015-03-10 22:20:16', '40', '2015-03-10 22:20:16', '40', '2015-03-10 22:20:16', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1012', '22', '2', 'languages', '16', '2015-03-10 22:22:48', '41', '2015-03-10 22:22:48', '41', '2015-03-10 22:22:48', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1013', '1012', '43', 'default', '16', '2019-03-08 17:03:52', '41', '2015-03-10 22:22:48', '41', '2015-03-10 22:22:48', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1014', '22', '2', 'language-translator', '1040', '2015-03-10 22:22:48', '41', '2015-03-10 22:22:48', '41', '2015-03-10 22:22:48', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1020', '30', '4', 'publisher', '1', '2016-10-24 17:09:08', '41', '2015-03-11 09:31:38', '41', '2015-03-11 09:31:38', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1022', '22', '2', 'logs', '1', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1023', '31', '5', 'logs-view', '1', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1024', '31', '5', 'logs-edit', '1', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1041', '31', '5', 'page-edit-images', '1', '2019-03-08 17:03:19', '41', '2019-03-08 17:03:19', '41', '2019-03-08 17:03:19', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1032', '22', '2', 'db-backups', '1', '2015-06-23 15:52:38', '41', '2015-06-23 15:52:38', '41', '2015-06-23 15:52:38', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1033', '31', '5', 'db-backup', '1', '2015-06-23 15:52:38', '41', '2015-06-23 15:52:38', '41', '2015-06-23 15:52:38', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1039', '1012', '43', 'en', '1', '2016-10-24 17:07:04', '41', '2016-10-24 17:07:04', '41', '2016-10-24 17:07:04', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1042', '1', '45', 'hello-world', '1', '2019-10-24 10:31:00', '41', '2019-03-13 16:38:40', '41', '2019-03-13 16:38:57', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1044', '1', '46', 'api', '1029', '2019-09-25 11:52:42', '41', '2019-04-17 09:48:40', '41', '2019-04-17 09:48:40', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1045', '22', '2', 'procache', '1', '2019-04-17 09:50:52', '41', '2019-04-17 09:50:52', '41', '2019-04-17 09:50:52', '7');

DROP TABLE IF EXISTS `pages_access`;
CREATE TABLE `pages_access` (
  `pages_id` int(11) NOT NULL,
  `templates_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('37', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('38', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('32', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('34', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('35', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('36', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('50', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('51', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('52', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('53', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('54', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1013', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1020', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1006', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1011', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1023', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1024', '2', '2015-06-18 22:08:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1033', '2', '2015-06-23 15:52:38');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1039', '2', '2016-10-24 17:07:04');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1041', '2', '2019-03-08 17:03:19');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1042', '1', '2019-03-13 16:38:40');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1044', '1', '2019-04-17 09:48:41');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('2', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1012', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1012', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1012', '22');

DROP TABLE IF EXISTS `pages_procache`;
CREATE TABLE `pages_procache` (
  `path` varchar(500) CHARACTER SET ascii NOT NULL,
  `pages_id` int(10) unsigned NOT NULL,
  `templates_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`path`),
  KEY `created` (`created`,`templates_id`),
  KEY `pages_id` (`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `pages_sortfields`;
CREATE TABLE `pages_sortfields` (
  `pages_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `session_login_throttle`;
CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `last_attempt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cache_time` mediumint(9) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1552061857,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1569416503,\"ns\":\"ProcessWire\",\"roles\":[37,1020]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('45', 'basic-page', '99', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1554985437,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('43', 'language', '97', '8', '0', '{\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Language\",\"pageLabelField\":\"name\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noChangeTemplate\":1,\"noUnpublish\":1,\"nameContentTab\":1,\"modified\":1426022568}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('44', 'http-status', '98', '0', '0', '{\"useRoles\":1,\"noChildren\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1552061875,\"ns\":\"ProcessWire\",\"roles\":[37,1020]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('46', 'api', '100', '0', '0', '{\"noChildren\":1,\"noParents\":-1,\"urlSegments\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1569406439,\"contentType\":\"json\",\"ns\":\"ProcessWire\"}');

UPDATE pages SET created_users_id=41, modified_users_id=41, created=NOW(), modified=NOW();

# --- /WireDatabaseBackup {"numTables":20,"numCreateTables":26,"numInserts":500,"numSeconds":0}