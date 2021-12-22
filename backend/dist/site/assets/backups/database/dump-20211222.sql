# --- WireDatabaseBackup {"time":"2021-12-22 10:32:06","user":"paadm","dbName":"permaculturealmanac","description":"","tables":[],"excludeTables":[],"excludeCreateTables":[],"excludeExportTables":[]}

DROP TABLE IF EXISTS `appapi_apikeys`;
CREATE TABLE `appapi_apikeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_user_id` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `accessable_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `appapi_apikeys` (`id`, `application_id`, `created`, `created_user_id`, `modified`, `modified_user_id`, `key`, `version`, `description`, `accessable_until`) VALUES('1', '1', '2021-05-12 19:56:15', '41', '2021-05-12 19:56:15', '41', 'zjoHA859mRXTJe1xBzsn2', '1.0.0', '', '1970-01-01 01:00:00');

DROP TABLE IF EXISTS `appapi_applications`;
CREATE TABLE `appapi_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `authtype` int(11) NOT NULL,
  `token_secret` varchar(100) NOT NULL,
  `expires_in` int(11) NOT NULL,
  `accesstoken_secret` varchar(100) NOT NULL,
  `default_application` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `appapi_applications` (`id`, `created`, `created_user_id`, `modified`, `modified_user_id`, `title`, `description`, `authtype`, `token_secret`, `expires_in`, `accesstoken_secret`, `default_application`) VALUES('1', '2021-05-12 19:37:39', '41', '2021-05-12 19:37:50', '41', 'default', '', '0', 'g+7xhbePyr37UautereikQzlVjqplKkcjI+jtjCQD3MqI085EnySV093', '2592000', 'nr4sWjfvdrsMCUglOOAcMoQ0edx+NLTNejeHy2jK', '0');

DROP TABLE IF EXISTS `appapi_apptokens`;
CREATE TABLE `appapi_apptokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_user_id` int(11) NOT NULL,
  `token_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `expiration_time` datetime DEFAULT NULL,
  `not_before_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('Modules.wire/modules/', 'Page/PageFrontEdit/PageFrontEdit.module\nLanguageSupport/FieldtypePageTitleLanguage.module\nLanguageSupport/LanguageSupportFields.module\nLanguageSupport/FieldtypeTextLanguage.module\nLanguageSupport/LanguageTabs.module\nLanguageSupport/FieldtypeTextareaLanguage.module\nLanguageSupport/LanguageSupport.module\nLanguageSupport/LanguageSupportPageNames.module\nLanguageSupport/ProcessLanguageTranslator.module\nLanguageSupport/ProcessLanguage.module\nTextformatter/TextformatterSmartypants/TextformatterSmartypants.module\nTextformatter/TextformatterMarkdownExtra/TextformatterMarkdownExtra.module\nTextformatter/TextformatterPstripper.module\nTextformatter/TextformatterStripTags.module\nTextformatter/TextformatterEntities.module\nTextformatter/TextformatterNewlineBR.module\nTextformatter/TextformatterNewlineUL.module\nPagePathHistory.module\nJquery/JqueryUI/JqueryUI.module\nJquery/JqueryTableSorter/JqueryTableSorter.module\nJquery/JqueryCore/JqueryCore.module\nJquery/JqueryWireTabs/JqueryWireTabs.module\nJquery/JqueryMagnific/JqueryMagnific.module\nLazyCron.module\nImage/ImageSizerEngineIMagick/ImageSizerEngineIMagick.module\nImage/ImageSizerEngineAnimatedGif/ImageSizerEngineAnimatedGif.module\nSystem/SystemUpdater/SystemUpdater.module\nSystem/SystemNotifications/SystemNotifications.module\nSystem/SystemNotifications/FieldtypeNotifications.module\nMarkup/MarkupCache.module\nMarkup/MarkupPageArray.module\nMarkup/MarkupHTMLPurifier/MarkupHTMLPurifier.module\nMarkup/MarkupPagerNav/MarkupPagerNav.module\nMarkup/MarkupPageFields.module\nMarkup/MarkupAdminDataTable/MarkupAdminDataTable.module\nMarkup/MarkupRSS.module\nPageRender.module\nFieldtype/FieldtypeImage/FieldtypeImage.module\nFieldtype/FieldtypeFieldsetOpen.module\nFieldtype/FieldtypeCache.module\nFieldtype/FieldtypeFile/FieldtypeFile.module\nFieldtype/FieldtypePage.module\nFieldtype/FieldtypeTextarea.module\nFieldtype/FieldtypePageTable.module\nFieldtype/FieldtypeModule.module\nFieldtype/FieldtypeRepeater/FieldtypeFieldsetPage.module\nFieldtype/FieldtypeRepeater/FieldtypeRepeater.module\nFieldtype/FieldtypeRepeater/InputfieldRepeater.module\nFieldtype/FieldtypePageTitle.module\nFieldtype/FieldtypeURL.module\nFieldtype/FieldtypeInteger.module\nFieldtype/FieldtypeDecimal.module\nFieldtype/FieldtypeFieldsetClose.module\nFieldtype/FieldtypeOptions/FieldtypeOptions.module\nFieldtype/FieldtypePassword.module\nFieldtype/FieldtypeCheckbox.module\nFieldtype/FieldtypeFloat.module\nFieldtype/FieldtypeSelector.module\nFieldtype/FieldtypeComments/FieldtypeComments.module\nFieldtype/FieldtypeComments/InputfieldCommentsAdmin.module\nFieldtype/FieldtypeComments/CommentFilterAkismet.module\nFieldtype/FieldtypeText.module\nFieldtype/FieldtypeFieldsetTabOpen.module\nFieldtype/FieldtypeToggle.module\nFieldtype/FieldtypeEmail.module\nFieldtype/FieldtypeDatetime.module\nAdminTheme/AdminThemeReno/AdminThemeReno.module\nAdminTheme/AdminThemeUikit/AdminThemeUikit.module\nAdminTheme/AdminThemeDefault/AdminThemeDefault.module\nPagePermissions.module\nInputfield/InputfieldInteger.module\nInputfield/InputfieldURL.module\nInputfield/InputfieldHidden.module\nInputfield/InputfieldPageTable/InputfieldPageTable.module\nInputfield/InputfieldFloat.module\nInputfield/InputfieldCheckboxes/InputfieldCheckboxes.module\nInputfield/InputfieldSelect.module\nInputfield/InputfieldFieldset.module\nInputfield/InputfieldImage/InputfieldImage.module\nInputfield/InputfieldTextarea.module\nInputfield/InputfieldFile/InputfieldFile.module\nInputfield/InputfieldToggle/InputfieldToggle.module\nInputfield/InputfieldButton.module\nInputfield/InputfieldAsmSelect/InputfieldAsmSelect.module\nInputfield/InputfieldPage/InputfieldPage.module\nInputfield/InputfieldEmail.module\nInputfield/InputfieldPageName/InputfieldPageName.module\nInputfield/InputfieldDatetime/InputfieldDatetime.module\nInputfield/InputfieldCKEditor/InputfieldCKEditor.module\nInputfield/InputfieldText/InputfieldText.module\nInputfield/InputfieldCheckbox/InputfieldCheckbox.module\nInputfield/InputfieldMarkup.module\nInputfield/InputfieldSelectMultiple.module\nInputfield/InputfieldIcon/InputfieldIcon.module\nInputfield/InputfieldRadios/InputfieldRadios.module\nInputfield/InputfieldPageTitle/InputfieldPageTitle.module\nInputfield/InputfieldPassword/InputfieldPassword.module\nInputfield/InputfieldPageAutocomplete/InputfieldPageAutocomplete.module\nInputfield/InputfieldSelector/InputfieldSelector.module\nInputfield/InputfieldSubmit/InputfieldSubmit.module\nInputfield/InputfieldTextTags/InputfieldTextTags.module\nInputfield/InputfieldForm.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelect.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelectMultiple.module\nInputfield/InputfieldName.module\nPagePaths.module\nFileCompilerTags.module\nProcess/ProcessModule/ProcessModule.module\nProcess/ProcessPageClone.module\nProcess/ProcessField/ProcessField.module\nProcess/ProcessPermission/ProcessPermission.module\nProcess/ProcessForgotPassword/ProcessForgotPassword.module\nProcess/ProcessPageEditLink/ProcessPageEditLink.module\nProcess/ProcessLogger/ProcessLogger.module\nProcess/ProcessPageLister/ProcessPageLister.module\nProcess/ProcessHome.module\nProcess/ProcessRole/ProcessRole.module\nProcess/ProcessPageView.module\nProcess/ProcessPageSearch/ProcessPageSearch.module\nProcess/ProcessPageList/ProcessPageList.module\nProcess/ProcessPageType/ProcessPageType.module\nProcess/ProcessPageEdit/ProcessPageEdit.module\nProcess/ProcessPageEditImageSelect/ProcessPageEditImageSelect.module\nProcess/ProcessCommentsManager/ProcessCommentsManager.module\nProcess/ProcessList.module\nProcess/ProcessPageSort.module\nProcess/ProcessUser/ProcessUser.module\nProcess/ProcessPagesExportImport/ProcessPagesExportImport.module\nProcess/ProcessLogin/ProcessLogin.module\nProcess/ProcessPageTrash.module\nProcess/ProcessRecentPages/ProcessRecentPages.module\nProcess/ProcessTemplate/ProcessTemplate.module\nProcess/ProcessPageAdd/ProcessPageAdd.module\nProcess/ProcessProfile/ProcessProfile.module\nSession/SessionLoginThrottle/SessionLoginThrottle.module\nSession/SessionHandlerDB/ProcessSessionDB.module\nSession/SessionHandlerDB/SessionHandlerDB.module', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('ModulesUninstalled.info', '{\"PageFrontEdit\":{\"name\":\"PageFrontEdit\",\"title\":\"Front-End Page Editor\",\"version\":3,\"versionStr\":\"0.0.3\",\"author\":\"Ryan Cramer\",\"summary\":\"Enables front-end editing of page fields.\",\"icon\":\"cube\",\"permissions\":{\"page-edit-front\":\"Use the front-end page editor\"},\"autoload\":true,\"created\":1638269293,\"installed\":false,\"configurable\":\"PageFrontEditConfig.php\",\"namespace\":\"ProcessWire\\\\\",\"core\":true,\"license\":\"MPL 2.0\"},\"FieldtypePageTitleLanguage\":{\"name\":\"FieldtypePageTitleLanguage\",\"title\":\"Page Title (Multi-Language)\",\"version\":100,\"versionStr\":\"1.0.0\",\"author\":\"Ryan Cramer\",\"summary\":\"Field that stores a page title in multiple languages. Use this only if you want title inputs created for ALL languages on ALL pages. Otherwise create separate languaged-named title fields, i.e. title_fr, title_es, title_fi, etc. \",\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0],\"FieldtypeTextLanguage\":[\">=\",0]},\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"LanguageSupportFields\":{\"name\":\"LanguageSupportFields\",\"title\":\"Languages Support - Fields\",\"version\":101,\"versionStr\":\"1.0.1\",\"author\":\"Ryan Cramer\",\"summary\":\"Required to use multi-language fields.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"installs\":[\"FieldtypePageTitleLanguage\",\"FieldtypeTextareaLanguage\",\"FieldtypeTextLanguage\"],\"autoload\":true,\"singular\":true,\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypeTextLanguage\":{\"name\":\"FieldtypeTextLanguage\",\"title\":\"Text (Multi-language)\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Field that stores a single line of text in multiple languages\",\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"LanguageTabs\":{\"name\":\"LanguageTabs\",\"title\":\"Languages Support - Tabs\",\"version\":115,\"versionStr\":\"1.1.5\",\"author\":\"adamspruijt, ryan\",\"summary\":\"Organizes multi-language fields into tabs for a cleaner easier to use interface.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"autoload\":\"template=admin\",\"singular\":true,\"created\":1638269293,\"installed\":false,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypeTextareaLanguage\":{\"name\":\"FieldtypeTextareaLanguage\",\"title\":\"Textarea (Multi-language)\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Field that stores a multiple lines of text in multiple languages\",\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"LanguageSupportPageNames\":{\"name\":\"LanguageSupportPageNames\",\"title\":\"Languages Support - Page Names\",\"version\":10,\"versionStr\":\"0.1.0\",\"author\":\"Ryan Cramer\",\"summary\":\"Required to use multi-language page names.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0],\"LanguageSupportFields\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1638269293,\"installed\":false,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"TextformatterSmartypants\":{\"name\":\"TextformatterSmartypants\",\"title\":\"SmartyPants Typographer\",\"version\":171,\"versionStr\":\"1.7.1\",\"summary\":\"Smart typography for web sites, by Michel Fortin based on SmartyPants by John Gruber. If combined with Markdown, it should be applied AFTER Markdown.\",\"created\":1638269293,\"installed\":false,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"core\":true,\"url\":\"https:\\/\\/github.com\\/michelf\\/php-smartypants\"},\"TextformatterMarkdownExtra\":{\"name\":\"TextformatterMarkdownExtra\",\"title\":\"Markdown\\/Parsedown Extra\",\"version\":180,\"versionStr\":\"1.8.0\",\"summary\":\"Markdown\\/Parsedown extra lightweight markup language by Emanuil Rusev. Based on Markdown by John Gruber.\",\"created\":1638269293,\"installed\":false,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"TextformatterPstripper\":{\"name\":\"TextformatterPstripper\",\"title\":\"Paragraph Stripper\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips paragraph <p> tags that may have been applied by other text formatters before it. \",\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"TextformatterStripTags\":{\"name\":\"TextformatterStripTags\",\"title\":\"Strip Markup Tags\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips HTML\\/XHTML Markup Tags\",\"created\":1638269293,\"installed\":false,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"TextformatterNewlineBR\":{\"name\":\"TextformatterNewlineBR\",\"title\":\"Newlines to XHTML Line Breaks\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to XHTML line break <br \\/> tags. \",\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"TextformatterNewlineUL\":{\"name\":\"TextformatterNewlineUL\",\"title\":\"Newlines to Unordered List\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to <li> list items and surrounds in an <ul> unordered list. \",\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"PagePathHistory\":{\"name\":\"PagePathHistory\",\"title\":\"Page Path History\",\"version\":6,\"versionStr\":\"0.0.6\",\"summary\":\"Keeps track of past URLs where pages have lived and automatically redirects (301 permament) to the new location whenever the past URL is accessed.\",\"autoload\":true,\"singular\":true,\"created\":1638269293,\"installed\":false,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"LazyCron\":{\"name\":\"LazyCron\",\"title\":\"Lazy Cron\",\"version\":103,\"versionStr\":\"1.0.3\",\"summary\":\"Provides hooks that are automatically executed at various intervals. It is called \'lazy\' because it\'s triggered by a pageview, so the interval is guaranteed to be at least the time requested, rather than exactly the time requested. This is fine for most cases, but you can make it not lazy by connecting this to a real CRON job. See the module file for details. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/lazy-cron\\/\",\"autoload\":true,\"singular\":true,\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"SystemNotifications\":{\"name\":\"SystemNotifications\",\"title\":\"System Notifications\",\"version\":12,\"versionStr\":\"0.1.2\",\"summary\":\"Adds support for notifications in ProcessWire (currently in development)\",\"icon\":\"bell\",\"installs\":[\"FieldtypeNotifications\"],\"autoload\":true,\"created\":1638269293,\"installed\":false,\"configurable\":\"SystemNotificationsConfig.php\",\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypeNotifications\":{\"name\":\"FieldtypeNotifications\",\"title\":\"Notifications\",\"version\":4,\"versionStr\":\"0.0.4\",\"summary\":\"Field that stores user notifications.\",\"requiresVersions\":{\"SystemNotifications\":[\">=\",0]},\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"MarkupPageFields\":{\"name\":\"MarkupPageFields\",\"title\":\"Markup Page Fields\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Adds $page->renderFields() and $page->images->render() methods that return basic markup for output during development and debugging.\",\"autoload\":true,\"singular\":true,\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true,\"permanent\":true},\"MarkupRSS\":{\"name\":\"MarkupRSS\",\"title\":\"Markup RSS Feed\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Renders an RSS feed. Given a PageArray, renders an RSS feed of them.\",\"icon\":\"rss-square\",\"created\":1638269293,\"installed\":false,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypeCache\":{\"name\":\"FieldtypeCache\",\"title\":\"Cache\",\"version\":102,\"versionStr\":\"1.0.2\",\"summary\":\"Caches the values of other fields for fewer runtime queries. Can also be used to combine multiple text fields and have them all be searchable under the cached field name.\",\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypePageTable\":{\"name\":\"FieldtypePageTable\",\"title\":\"ProFields: Page Table\",\"version\":8,\"versionStr\":\"0.0.8\",\"summary\":\"A fieldtype containing a group of editable pages.\",\"installs\":[\"InputfieldPageTable\"],\"autoload\":true,\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypeFieldsetPage\":{\"name\":\"FieldtypeFieldsetPage\",\"title\":\"Fieldset (Seite)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Fieldset mit Feldern, die getrennt sind, um den Namensraum zu trennen (Seite), um die Wiederverwendung von Feldern zu erm\\u00f6glichen.\",\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"autoload\":true,\"created\":1638269293,\"installed\":false,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypeDecimal\":{\"name\":\"FieldtypeDecimal\",\"title\":\"Decimal\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Field that stores a decimal number\",\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypeSelector\":{\"name\":\"FieldtypeSelector\",\"title\":\"Selector\",\"version\":13,\"versionStr\":\"0.1.3\",\"author\":\"Avoine + ProcessWire\",\"summary\":\"Build a page finding selector visually.\",\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypeComments\":{\"name\":\"FieldtypeComments\",\"title\":\"Kommentare (Comments)\",\"version\":109,\"versionStr\":\"1.0.9\",\"summary\":\"Feld welches Kommentare von Nutzern zu einer einzelnen Seite speichert.\",\"installs\":[\"InputfieldCommentsAdmin\"],\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"InputfieldCommentsAdmin\":{\"name\":\"InputfieldCommentsAdmin\",\"title\":\"Administrator Kommentare\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Bietet ein administratives Interface zur Arbeit mit Kommentaren.\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"CommentFilterAkismet\":{\"name\":\"CommentFilterAkismet\",\"title\":\"Kommentar-Filter: Akismet\",\"version\":200,\"versionStr\":\"2.0.0\",\"summary\":\"Nutzt den Akismet-Service um Kommentarspam zu identifizieren. Modul-Plugin f\\u00fcr den Feldtyp Kommentar.\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1638269293,\"installed\":false,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FieldtypeToggle\":{\"name\":\"FieldtypeToggle\",\"title\":\"Toggle (Yes\\/No)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Configurable yes\\/no, on\\/off toggle alternative to a checkbox, plus optional \\u201cother\\u201d option.\",\"requiresVersions\":{\"InputfieldToggle\":[\">=\",0]},\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"AdminThemeReno\":{\"name\":\"AdminThemeReno\",\"title\":\"Reno\",\"version\":17,\"versionStr\":\"0.1.7\",\"author\":\"Tom Reno (Renobird)\",\"summary\":\"Admin theme for ProcessWire 2.5+ by Tom Reno (Renobird)\",\"requiresVersions\":{\"AdminThemeDefault\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1638269293,\"installed\":false,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"InputfieldPageTable\":{\"name\":\"InputfieldPageTable\",\"title\":\"ProFields: Page Table\",\"version\":14,\"versionStr\":\"0.1.4\",\"summary\":\"Eingabefeld erg\\u00e4nzend zu FieldtypePageTable\",\"requiresVersions\":{\"FieldtypePageTable\":[\">=\",0]},\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"PagePaths\":{\"name\":\"PagePaths\",\"title\":\"Page Paths\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Enables page paths\\/urls to be queryable by selectors. Also offers potential for improved load performance. Builds an index at install (may take time on a large site). Currently supports only single languages sites.\",\"autoload\":true,\"singular\":true,\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"FileCompilerTags\":{\"name\":\"FileCompilerTags\",\"title\":\"Tags File Compiler\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Enables {var} or {var.property} variables in markup sections of a file. Can be used with any API variable.\",\"created\":1638269293,\"installed\":false,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"ProcessPageClone\":{\"name\":\"ProcessPageClone\",\"title\":\"Seite klonen\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Stellt die M\\u00f6glichkeit bereit, Seiten im Admin-Bereich zu klonen\\/kopieren\\/duplizieren. F\\u00fcgt allen passenden Seiten in der PageList eine Option &quot;kopieren&quot; hinzu.\",\"permission\":\"page-clone\",\"permissions\":{\"page-clone\":\"Clone a page\",\"page-clone-tree\":\"Clone a tree of pages\"},\"autoload\":\"template=admin\",\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true,\"page\":{\"name\":\"clone\",\"title\":\"Clone\",\"parent\":\"page\",\"status\":1024}},\"ProcessForgotPassword\":{\"name\":\"ProcessForgotPassword\",\"title\":\"Forgot Password\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Provides password reset\\/email capability for the Login process.\",\"permission\":\"page-view\",\"created\":1638269293,\"installed\":false,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"ProcessCommentsManager\":{\"name\":\"ProcessCommentsManager\",\"title\":\"Kommentare\",\"version\":10,\"versionStr\":\"0.1.0\",\"author\":\"Ryan Cramer\",\"summary\":\"Verwalten Sie Kommentare auf Ihrer Website au\\u00dferhalb des Seiteneditors.\",\"icon\":\"comments\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"permission\":\"comments-manager\",\"permissions\":{\"comments-manager\":\"Use the comments manager\"},\"created\":1638269293,\"installed\":false,\"searchable\":\"comments\",\"namespace\":\"ProcessWire\\\\\",\"core\":true,\"page\":{\"name\":\"comments\",\"parent\":\"setup\",\"title\":\"Comments\"},\"nav\":[{\"url\":\"?go=approved\",\"label\":\"Best\\u00e4tigt\"},{\"url\":\"?go=pending\",\"label\":\"Wartet\"},{\"url\":\"?go=spam\",\"label\":\"Spam\"},{\"url\":\"?go=all\",\"label\":\"Alle\"}]},\"ProcessPagesExportImport\":{\"name\":\"ProcessPagesExportImport\",\"title\":\"Pages Export\\/Import\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Ryan Cramer\",\"summary\":\"Enables exporting and importing of pages. Development version, not yet recommended for production use.\",\"icon\":\"paper-plane-o\",\"permission\":\"page-edit-export\",\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true,\"page\":{\"name\":\"export-import\",\"parent\":\"page\",\"title\":\"Export\\/Import\"}},\"ProcessSessionDB\":{\"name\":\"ProcessSessionDB\",\"title\":\"Sessions\",\"version\":5,\"versionStr\":\"0.0.5\",\"summary\":\"Erm\\u00f6glicht ihnen, die aktiven Datenbank Sessions zu durchsuchen\",\"icon\":\"dashboard\",\"requiresVersions\":{\"SessionHandlerDB\":[\">=\",0]},\"created\":1638269293,\"installed\":false,\"namespace\":\"ProcessWire\\\\\",\"core\":true,\"page\":{\"name\":\"sessions-db\",\"parent\":\"access\",\"title\":\"Sessions\"}},\"SessionHandlerDB\":{\"name\":\"SessionHandlerDB\",\"title\":\"Session Handler Database\",\"version\":6,\"versionStr\":\"0.0.6\",\"summary\":\"Installing this module makes ProcessWire store sessions in the database rather than the file system. Note that this module will log you out after install or uninstall.\",\"installs\":[\"ProcessSessionDB\"],\"created\":1638269293,\"installed\":false,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"core\":true},\"Helloworld\":{\"name\":\"Helloworld\",\"title\":\"Hello World\",\"version\":3,\"versionStr\":\"0.0.3\",\"summary\":\"An example module used for demonstration purposes.\",\"href\":\"https:\\/\\/processwire.com\",\"icon\":\"smile-o\",\"autoload\":true,\"singular\":true,\"created\":1638269292,\"installed\":false},\"TextformatterBuster\":{\"name\":\"TextformatterBuster\",\"title\":\"ProCache Buster\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Automatically cache-bust file assets linked in HTML.\",\"requiresVersions\":{\"ProCache\":[\">=\",0]},\"created\":1638269292,\"installed\":false,\"configurable\":4,\"namespace\":\"\\\\\"}}', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('ModulesVerbose.info', '{\"160\":{\"summary\":\"ProcessWire multi-language support.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.3\"},\"162\":{\"summary\":\"Provides language translation capabilities for ProcessWire core and modules.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.1\"},\"161\":{\"summary\":\"Systemsprachen verwalten\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"1.0.3\",\"permissions\":{\"lang-edit\":\"Administer languages and static translation files\"}},\"61\":{\"summary\":\"Enkodiert kaufm\\u00e4nnisches Und, Anf\\u00fchrungszeichen (einfach und doppelt) und die Zeichen gr\\u00f6\\u00dfer\\/kleiner als mittels htmlspecialchars(str, ENT_QUOTES) in Entit\\u00e4ten. Es wird empfohlen, dies auf alle Text\\/Textarea-Felder mit Ausnahme derer, die einen Rich-Text-Editor oder eine Markup-Sprache wie Markdown verwenden, anzuwenden.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"117\":{\"summary\":\"jQuery UI as required by ProcessWire and plugins\",\"href\":\"http:\\/\\/ui.jquery.com\",\"core\":true,\"versionStr\":\"1.9.6\"},\"103\":{\"summary\":\"Provides a jQuery plugin for sorting tables.\",\"href\":\"http:\\/\\/mottie.github.io\\/tablesorter\\/\",\"core\":true,\"versionStr\":\"2.2.1\"},\"116\":{\"summary\":\"jQuery Core as required by ProcessWire Admin and plugins\",\"href\":\"http:\\/\\/jquery.com\",\"core\":true,\"versionStr\":\"1.8.3\"},\"45\":{\"summary\":\"Stellt ein jQuery-Plugin bereit, um in ProcessWire Tabs zu erzeugen\",\"core\":true,\"versionStr\":\"1.1.0\"},\"151\":{\"summary\":\"Provides lightbox capability for image galleries. Replacement for FancyBox. Uses Magnific Popup by @dimsemenov.\",\"href\":\"http:\\/\\/dimsemenov.com\\/plugins\\/magnific-popup\\/\",\"core\":true,\"versionStr\":\"0.0.1\"},\"197\":{\"summary\":\"Upgrades image manipulations to use PHP\'s ImageMagick library when possible.\",\"author\":\"Horst Nogajski\",\"core\":true,\"versionStr\":\"0.0.3\"},\"198\":{\"summary\":\"Upgrades image manipulations for animated GIFs.\",\"author\":\"Horst Nogajski\",\"core\":true,\"versionStr\":\"0.0.1\"},\"139\":{\"summary\":\"System-Versionen und Upgrades verwalten.\",\"core\":true,\"versionStr\":\"0.1.9\"},\"172\":{\"summary\":\"A simple way to cache segments of markup in your templates. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/markupcache\\/\",\"core\":true,\"versionStr\":\"1.0.1\"},\"113\":{\"summary\":\"Adds renderPager() method to all PaginatedArray types, for easy pagination output. Plus a render() method to PageArray instances.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"156\":{\"summary\":\"Front-end to the HTML Purifier library.\",\"core\":true,\"versionStr\":\"4.9.6\"},\"98\":{\"summary\":\"Generates markup for pagination navigation\",\"core\":true,\"versionStr\":\"1.0.5\"},\"67\":{\"summary\":\"Generates markup for data tables used by ProcessWire admin\",\"core\":true,\"versionStr\":\"1.0.7\"},\"115\":{\"summary\":\"F\\u00fcgt Seiten eine Rendering-Methode und Caching der Seitenausgabe hinzu\",\"core\":true,\"versionStr\":\"1.0.5\"},\"57\":{\"summary\":\"Field that stores one or more GIF, JPG, or PNG images\",\"core\":true,\"versionStr\":\"1.0.2\"},\"105\":{\"summary\":\"Open a fieldset to group fields. Should be followed by a Fieldset (Close) after one or more fields.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"6\":{\"summary\":\"Field that stores one or more files\",\"core\":true,\"versionStr\":\"1.0.7\"},\"4\":{\"summary\":\"Field that stores one or more references to ProcessWire pages\",\"core\":true,\"versionStr\":\"1.0.6\"},\"1\":{\"summary\":\"Field that stores multiple lines of text\",\"core\":true,\"versionStr\":\"1.0.7\"},\"27\":{\"summary\":\"Field that stores a reference to another module\",\"core\":true,\"versionStr\":\"1.0.1\"},\"220\":{\"summary\":\"Verwaltet eine Sammlung von Feldern, welche beliebig oft wiederholt werden k\\u00f6nnen.\",\"core\":true,\"versionStr\":\"1.0.7\"},\"221\":{\"summary\":\"Wiederholt Felder aus einen anderen Template. Stellt das Eingabefeld f\\u00fcr FieldtypeRepeater bereit.\",\"core\":true,\"versionStr\":\"1.0.7\"},\"111\":{\"summary\":\"Field that stores a page title\",\"core\":true,\"versionStr\":\"1.0.0\"},\"135\":{\"summary\":\"Feld, welches eine URL speichert\",\"core\":true,\"versionStr\":\"1.0.1\"},\"84\":{\"summary\":\"Field that stores an integer\",\"core\":true,\"versionStr\":\"1.0.2\"},\"106\":{\"summary\":\"Close a fieldset opened by FieldsetOpen. \",\"core\":true,\"versionStr\":\"1.0.0\"},\"225\":{\"summary\":\"Feld welches Einzel- und Mehrfachauswahl-Optionen speichert.\",\"core\":true,\"versionStr\":\"0.0.2\"},\"133\":{\"summary\":\"Field that stores a hashed and salted password\",\"core\":true,\"versionStr\":\"1.0.1\"},\"97\":{\"summary\":\"This Fieldtype stores an ON\\/OFF toggle via a single checkbox. The ON value is 1 and OFF value is 0.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"89\":{\"summary\":\"Field that stores a floating point number\",\"core\":true,\"versionStr\":\"1.0.6\"},\"3\":{\"summary\":\"Field that stores a single line of text\",\"core\":true,\"versionStr\":\"1.0.2\"},\"107\":{\"summary\":\"Open a fieldset to group fields. Same as Fieldset (Open) except that it displays in a tab instead.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"29\":{\"summary\":\"Field that stores an e-mail address\",\"core\":true,\"versionStr\":\"1.0.1\"},\"28\":{\"summary\":\"Field that stores a date and optionally time\",\"core\":true,\"versionStr\":\"1.0.5\"},\"196\":{\"summary\":\"Uikit v3 admin theme\",\"core\":true,\"versionStr\":\"0.3.3\"},\"148\":{\"summary\":\"Minimal admin theme that supports all ProcessWire features.\",\"core\":true,\"versionStr\":\"0.1.4\"},\"114\":{\"summary\":\"Adds various permission methods to Page objects that are used by Process modules.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"85\":{\"summary\":\"Integer (positiv oder negativ)\",\"core\":true,\"versionStr\":\"1.0.5\"},\"108\":{\"summary\":\"URL in g\\u00fcltigem Format\",\"core\":true,\"versionStr\":\"1.0.2\"},\"40\":{\"summary\":\"Versteckter Wert in einem Formular\",\"core\":true,\"versionStr\":\"1.0.1\"},\"90\":{\"summary\":\"Flie\\u00dfkommazahl mit Genauigkeit\",\"core\":true,\"versionStr\":\"1.0.4\"},\"38\":{\"summary\":\"Auswahl zwischen mehreren Checkboxen\",\"core\":true,\"versionStr\":\"1.0.8\"},\"36\":{\"summary\":\"Auswahl eines einzelnen Wertes aus einer select-Box\",\"core\":true,\"versionStr\":\"1.0.2\"},\"78\":{\"summary\":\"Gruppiert eines oder mehrere Felder in einem Container\",\"core\":true,\"versionStr\":\"1.0.1\"},\"56\":{\"summary\":\"Ein oder mehrere hochzuladende Bilder (sortierbar)\",\"core\":true,\"versionStr\":\"1.2.4\"},\"35\":{\"summary\":\"Mehrzeiliger Text\",\"core\":true,\"versionStr\":\"1.0.3\"},\"55\":{\"summary\":\"Eine oder mehrere hochzuladende Dateien (sortierbar)\",\"core\":true,\"versionStr\":\"1.2.6\"},\"224\":{\"summary\":\"A toggle providing similar input capability to a checkbox but much more configurable.\",\"core\":true,\"versionStr\":\"0.0.1\"},\"131\":{\"summary\":\"Button als Formular-Element, dem Sie optional ein href-Attribut zuweisen k\\u00f6nnen\",\"core\":true,\"versionStr\":\"1.0.0\"},\"25\":{\"summary\":\"Mehrfach-Auswahl; Progressive Enhancement, um mehrere Elemente auszuw\\u00e4hlen\",\"core\":true,\"versionStr\":\"2.0.2\"},\"60\":{\"summary\":\"Select one or more pages\",\"core\":true,\"versionStr\":\"1.0.7\"},\"80\":{\"summary\":\"E-Mail-Adresse in g\\u00fcltigem Format\",\"core\":true,\"versionStr\":\"1.0.1\"},\"86\":{\"summary\":\"Text input validated as a ProcessWire Page name field\",\"core\":true,\"versionStr\":\"1.0.6\"},\"94\":{\"summary\":\"Eingabefeld f\\u00fcr Datum und optional Uhrzeit.\",\"core\":true,\"versionStr\":\"1.0.7\"},\"155\":{\"summary\":\"CKEditor-Textfeld Rich Text Editor\",\"core\":true,\"versionStr\":\"1.6.8\"},\"34\":{\"summary\":\"Single line of text\",\"core\":true,\"versionStr\":\"1.0.6\"},\"37\":{\"summary\":\"Single checkbox toggle\",\"core\":true,\"versionStr\":\"1.0.6\"},\"79\":{\"summary\":\"Enth\\u00e4lt beliebiges anderes Markup und optional Kind-Eingabefelder\",\"core\":true,\"versionStr\":\"1.0.2\"},\"43\":{\"summary\":\"Mehrfachauswahl aus einer Liste\",\"core\":true,\"versionStr\":\"1.0.1\"},\"178\":{\"summary\":\"Ein Symbol ausw\\u00e4hlen\",\"core\":true,\"versionStr\":\"0.0.3\"},\"39\":{\"summary\":\"Radio-Buttons, um ein einzelnes Feld auszuw\\u00e4hlen\",\"core\":true,\"versionStr\":\"1.0.6\"},\"112\":{\"summary\":\"Verwaltet die Eingabe des Seitentitels und automatische Erstellung des Seitennamens (wenn Name leer ist)\",\"core\":true,\"versionStr\":\"1.0.2\"},\"122\":{\"summary\":\"Passworteingabe mit Best\\u00e4tigungsfeld, das die Eingabe nicht zur\\u00fcckgibt.\",\"core\":true,\"versionStr\":\"1.0.2\"},\"202\":{\"summary\":\"Mehrfach-Seitenauswahl mit Autovervollst\\u00e4ndigung und Sortierbarkeit. Vorgesehen als Eingabefeld f\\u00fcr Page reference-Felder.\",\"core\":true,\"versionStr\":\"1.1.2\"},\"149\":{\"summary\":\"Build a page finding selector visually.\",\"author\":\"Avoine + ProcessWire\",\"core\":true,\"versionStr\":\"0.2.8\"},\"32\":{\"summary\":\"Button, um Formulare abzusenden\",\"core\":true,\"versionStr\":\"1.0.3\"},\"219\":{\"summary\":\"Enables input of user entered tags or selection of predefined tags.\",\"core\":true,\"versionStr\":\"0.0.5\"},\"30\":{\"summary\":\"Enth\\u00e4lt ein oder mehrere Formularfeld(er)\",\"core\":true,\"versionStr\":\"1.0.7\"},\"15\":{\"summary\":\"Auswahl einer einzelnen Seite aus einem ProcessWire-Seitenbaum\",\"core\":true,\"versionStr\":\"1.0.1\"},\"137\":{\"summary\":\"Auswahl mehrerer Seiten aus einem ProcessWire-Seitenbaum\",\"core\":true,\"versionStr\":\"1.0.2\"},\"41\":{\"summary\":\"Texteingabe, die als Namensfeld in ProcessWire g\\u00fcltig ist\",\"core\":true,\"versionStr\":\"1.0.0\"},\"50\":{\"summary\":\"Module auflisten, bearbeiten oder (de)installieren\",\"core\":true,\"versionStr\":\"1.1.9\"},\"48\":{\"summary\":\"Einzelne Felder bearbeiten, die Seiten-Daten enthalten\",\"core\":true,\"versionStr\":\"1.1.3\",\"searchable\":\"fields\"},\"136\":{\"summary\":\"System-Berechtigungen verwalten\",\"core\":true,\"versionStr\":\"1.0.1\"},\"121\":{\"summary\":\"Provides a link capability as used by some Fieldtype modules (like rich text editors).\",\"core\":true,\"versionStr\":\"1.0.9\"},\"177\":{\"summary\":\"System Protokolle anschauen und verwalten.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"logs-view\":\"Can view system logs\",\"logs-edit\":\"Can manage system logs\"},\"page\":{\"name\":\"logs\",\"parent\":\"setup\",\"title\":\"Logs\"}},\"150\":{\"summary\":\"Admin tool for finding and listing pages by any property.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.2.6\",\"permissions\":{\"page-lister\":\"Use Page Lister\"}},\"87\":{\"summary\":\"Agiert als Platzhalter-Prozess f\\u00fcr die Wurzelseite des Adminbereiches. Stellt die richtige Flow-Kontrolle nach dem Login sicher.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"68\":{\"summary\":\"Benutzerrollen und mit ihnen verkn\\u00fcpfte Berechtigungen verwalten\",\"core\":true,\"versionStr\":\"1.0.4\"},\"83\":{\"summary\":\"Alle Seitenansichten werden durch diesen Prozess geroutet\",\"core\":true,\"versionStr\":\"1.0.4\"},\"104\":{\"summary\":\"Provides a page search engine for admin use.\",\"core\":true,\"versionStr\":\"1.0.6\"},\"12\":{\"summary\":\"List pages in a hierarchical tree structure\",\"core\":true,\"versionStr\":\"1.2.3\"},\"134\":{\"summary\":\"Seiten eines bestimmten Typs auflisten, bearbeiten und hinzuf\\u00fcgen\",\"core\":true,\"versionStr\":\"1.0.1\"},\"7\":{\"summary\":\"Edit a Page\",\"core\":true,\"versionStr\":\"1.1.0\"},\"129\":{\"summary\":\"Provides image manipulation functions for image fields and rich text editors.\",\"core\":true,\"versionStr\":\"1.2.0\"},\"76\":{\"summary\":\"Listet den jeder Kindseite der aktuellen Seite zugewiesenen Prozess auf\",\"core\":true,\"versionStr\":\"1.0.1\"},\"14\":{\"summary\":\"Handhabt das sortieren und verschieben von Seiten in der Seiten-Liste\",\"core\":true,\"versionStr\":\"1.0.0\"},\"66\":{\"summary\":\"System-Benutzer verwalten\",\"core\":true,\"versionStr\":\"1.0.7\",\"searchable\":\"users\"},\"10\":{\"summary\":\"Login to ProcessWire\",\"core\":true,\"versionStr\":\"1.0.8\"},\"109\":{\"summary\":\"Handhabt das Leeren des Papierkorbs f\\u00fcr Seiten\",\"core\":true,\"versionStr\":\"1.0.3\"},\"159\":{\"summary\":\"Shows a list of recently edited pages in your admin.\",\"author\":\"Ryan Cramer\",\"href\":\"http:\\/\\/modules.processwire.com\\/\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"page-edit-recent\":\"Can see recently edited pages\"},\"page\":{\"name\":\"recent-pages\",\"parent\":\"page\",\"title\":\"Recent\"}},\"47\":{\"summary\":\"Templates auflisten und bearbeiten, die die Seitenausgabe kontrollieren\",\"core\":true,\"versionStr\":\"1.1.4\",\"searchable\":\"templates\"},\"17\":{\"summary\":\"Eine neue Seite hinzuf\\u00fcgen\",\"core\":true,\"versionStr\":\"1.0.8\"},\"138\":{\"summary\":\"Erlaubt dem Benutzer, Passwort, E-Mail-Adresse und andere Einstellungen zu \\u00e4ndern, die Sie vorgeben.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"125\":{\"summary\":\"Throttles login attempts to help prevent dictionary attacks.\",\"core\":true,\"versionStr\":\"1.0.3\"},\"223\":{\"summary\":\"Commercial module (Inputfield) providing multi-type repeaters.\",\"versionStr\":\"0.0.5\"},\"222\":{\"summary\":\"Commercial module (Fieldtype) providing multi-type repeaters.\",\"versionStr\":\"0.0.5\"},\"205\":{\"summary\":\"Configuration and maintenance utilty for the ProCache module\",\"author\":\"Ryan Cramer Design, LLC\",\"href\":\"https:\\/\\/processwire.com\\/ProCache\\/\",\"versionStr\":\"3.1.8\"},\"204\":{\"summary\":\"For a big performance boost, Pro Cache delivers site pages as static files without PHP or MySQL.\",\"author\":\"Ryan Cramer Design, LLC\",\"href\":\"https:\\/\\/processwire.com\\/ProCache\\/\",\"versionStr\":\"3.1.8\"},\"211\":{\"summary\":\"Module to create a REST API with ProcessWire\",\"author\":\"Sebastian Schendel\",\"href\":\"https:\\/\\/modules.processwire.com\\/modules\\/app-api\\/\",\"versionStr\":\"1.1.5\",\"permissions\":{\"appapi_manage_applications\":\"Manage AppApi settings\"},\"page\":{\"name\":\"appapi\",\"parent\":\"setup\",\"title\":\"AppApi\",\"icon\":\"terminal\"}},\"210\":{\"summary\":\"Automatically rename file\\/image uploads according to a configurable format\",\"author\":\"Adrian Jones\",\"href\":\"http:\\/\\/modules.processwire.com\\/modules\\/process-custom-upload-names\\/\",\"versionStr\":\"1.3.1\"},\"186\":{\"summary\":\"Create and\\/or restore database backups from ProcessWire admin.\",\"author\":\"Ryan Cramer\",\"versionStr\":\"0.0.5\",\"permissions\":{\"db-backup\":\"Manage database backups (recommended for superuser only)\"},\"page\":{\"name\":\"db-backups\",\"parent\":\"setup\",\"title\":\"DB Backups\"}}}', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('Permissions.names', '{\"appapi_manage_applications\":1050,\"db-backup\":1033,\"logs-edit\":1024,\"logs-view\":1023,\"page-delete\":34,\"page-edit\":32,\"page-edit-images\":1041,\"page-edit-recent\":1011,\"page-lister\":1006,\"page-lock\":54,\"page-move\":35,\"page-sort\":50,\"page-template\":51,\"page-view\":36,\"profile-edit\":53,\"user-admin\":52}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__eb35c1335a51ab0eaec2db75fd454bec', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/ready.php\",\"hash\":\"163e73fd20d189301c1bebb7638ba987\",\"size\":1452,\"time\":1638266276,\"ns\":\"ProcessWire\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/ready.php\",\"hash\":\"163e73fd20d189301c1bebb7638ba987\",\"size\":1452,\"time\":1638266276}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('Modules.site/modules/', 'FieldtypeRepeaterMatrix/InputfieldRepeaterMatrix.module\nFieldtypeRepeaterMatrix/FieldtypeRepeaterMatrix.module\nHelloworld/Helloworld.module\nProCache/TextformatterBuster.module\nProCache/ProcessProCache.module\nProCache/ProCache.module\nAppApi/AppApi.module.php\nProcessCustomUploadNames/ProcessCustomUploadNames.module.php\nProcessDatabaseBackups/ProcessDatabaseBackups.module', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__0b57bcd70a55f18f786a1f17881e85a4', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/ProcessProCache.module\",\"hash\":\"f40f360e8fa6a5510577169c8da06de1\",\"size\":59312,\"time\":1638266276,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/ProcessProCache.module\",\"hash\":\"1cc2f6f42189217fe8dc5dff4dd12550\",\"size\":60205,\"time\":1638266276}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__99566e9ae43efdb5364295fd78d88e8f', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/ProCache.module\",\"hash\":\"5da132345fdf220e4c29f7a61ae43f1d\",\"size\":56433,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/ProCache.module\",\"hash\":\"b933014793cfa3e0e4a3b875672b89fc\",\"size\":58286,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__ff5e3d35615b4a308a24722c6f273da7', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/AppApi\\/AppApi.config.php\",\"hash\":\"972f494e0fa4dc63b328a13e186c10ab\",\"size\":914,\"time\":1638266276,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/AppApi\\/AppApi.config.php\",\"hash\":\"972f494e0fa4dc63b328a13e186c10ab\",\"size\":914,\"time\":1638266276}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__ea37f22e204ae8a7612f2801a9f2a22b', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProcessCustomUploadNames\\/ProcessCustomUploadNames.module.php\",\"hash\":\"705f5dee31940c76d32191dde04dd834\",\"size\":42867,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProcessCustomUploadNames\\/ProcessCustomUploadNames.module.php\",\"hash\":\"f8a85c3ccbd014024bd146edd0c246bf\",\"size\":43767,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__47b8abeedc0712a91adf92f58a01fc79', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/ProCacheBuster.php\",\"hash\":\"b5f228eac8d0ad0ff37196776058c9b5\",\"size\":6595,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/ProCacheBuster.php\",\"hash\":\"00622f699cc854d8571890658167b4f4\",\"size\":6608,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__ac8962bef77f2b04ff84f5718ba62f55', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/pwpc-func-ns.php\",\"hash\":\"30f84a0e49a9c38fce85ac280dfaf289\",\"size\":682,\"time\":1638266276,\"ns\":\"ProcessWire\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/pwpc-func-ns.php\",\"hash\":\"30f84a0e49a9c38fce85ac280dfaf289\",\"size\":682,\"time\":1638266276}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__1281df4973523503e1738f257d98af5d', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/pwpc-func.php\",\"hash\":\"235062cc170b365d38fed0cf2213e52f\",\"size\":635,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/pwpc-func.php\",\"hash\":\"dde5945b6a20cefc0d6c17a8e0f16429\",\"size\":674,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__c7964554a2dfb28e7bca8b2bddce25e8', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/templates\\/admin.php\",\"hash\":\"9636f854995462a4cb877cb1204bc2fe\",\"size\":467,\"time\":1638266276,\"ns\":\"ProcessWire\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/templates\\/admin.php\",\"hash\":\"9636f854995462a4cb877cb1204bc2fe\",\"size\":467,\"time\":1638266276}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__eb05e72b5948bc88b745fd41f291a754', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/TextformatterBuster.module\",\"hash\":\"c83e6ca0eb47fa8171d14a74fc34e408\",\"size\":5949,\"time\":1638266276,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/TextformatterBuster.module\",\"hash\":\"4501be111d345452883433134bef8afa\",\"size\":6001,\"time\":1638266276}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__48f5d69e92765d4c4af5234f4364a214', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/templates\\/http-status.php\",\"hash\":\"e7c904798dbdc2fda27c25e6ab377963\",\"size\":29,\"time\":1638269292,\"ns\":\"ProcessWire\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/templates\\/http-status.php\",\"hash\":\"e7c904798dbdc2fda27c25e6ab377963\",\"size\":29,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('Modules.info', '{\"160\":{\"name\":\"LanguageSupport\",\"title\":\"Languages Support\",\"version\":103,\"installs\":[\"ProcessLanguage\",\"ProcessLanguageTranslator\"],\"autoload\":true,\"singular\":true,\"created\":1426022568,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"addFlag\":32},\"162\":{\"name\":\"ProcessLanguageTranslator\",\"title\":\"Language Translator\",\"version\":101,\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"singular\":1,\"created\":1426022568,\"namespace\":\"ProcessWire\\\\\"},\"161\":{\"name\":\"ProcessLanguage\",\"title\":\"Sprachen\",\"version\":103,\"icon\":\"language\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"singular\":1,\"created\":1426022568,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"useNavJSON\":true},\"61\":{\"name\":\"TextformatterEntities\",\"title\":\"HTML Entity Encoder (htmlspecialchars)\",\"version\":100,\"namespace\":\"ProcessWire\\\\\"},\"117\":{\"name\":\"JqueryUI\",\"title\":\"jQuery UI\",\"version\":196,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"103\":{\"name\":\"JqueryTableSorter\",\"title\":\"jQuery Table Sorter Plugin\",\"version\":221,\"singular\":1,\"namespace\":\"ProcessWire\\\\\"},\"116\":{\"name\":\"JqueryCore\",\"title\":\"jQuery Core\",\"version\":183,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"45\":{\"name\":\"JqueryWireTabs\",\"title\":\"jQuery Wire Tabs Plugin\",\"version\":110,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"151\":{\"name\":\"JqueryMagnific\",\"title\":\"jQuery Magnific Popup\",\"version\":1,\"singular\":1,\"created\":1405920105,\"namespace\":\"ProcessWire\\\\\"},\"197\":{\"name\":\"ImageSizerEngineIMagick\",\"title\":\"IMagick Image Sizer\",\"version\":3,\"created\":1522908028,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\"},\"198\":{\"name\":\"ImageSizerEngineAnimatedGif\",\"title\":\"Animated GIF Image Sizer\",\"version\":1,\"created\":1522908035,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\"},\"139\":{\"name\":\"SystemUpdater\",\"title\":\"System-Updater\",\"version\":19,\"singular\":true,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"172\":{\"name\":\"MarkupCache\",\"title\":\"Markup Cache\",\"version\":101,\"autoload\":true,\"singular\":true,\"created\":1426061577,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\"},\"113\":{\"name\":\"MarkupPageArray\",\"title\":\"PageArray Markup\",\"version\":100,\"autoload\":true,\"singular\":true,\"namespace\":\"ProcessWire\\\\\"},\"156\":{\"name\":\"MarkupHTMLPurifier\",\"title\":\"HTML Purifier\",\"version\":496,\"created\":1406276777,\"namespace\":\"ProcessWire\\\\\"},\"98\":{\"name\":\"MarkupPagerNav\",\"title\":\"Pager (Pagination) Navigation\",\"version\":105,\"namespace\":\"ProcessWire\\\\\"},\"67\":{\"name\":\"MarkupAdminDataTable\",\"title\":\"Admin Data Table\",\"version\":107,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"115\":{\"name\":\"PageRender\",\"title\":\"Seiten-Rendering\",\"version\":105,\"autoload\":true,\"singular\":true,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"57\":{\"name\":\"FieldtypeImage\",\"title\":\"Images\",\"version\":102,\"singular\":true,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"105\":{\"name\":\"FieldtypeFieldsetOpen\",\"title\":\"Fieldset (Open)\",\"version\":101,\"singular\":1,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"6\":{\"name\":\"FieldtypeFile\",\"title\":\"Files\",\"version\":107,\"singular\":true,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"4\":{\"name\":\"FieldtypePage\",\"title\":\"Page Reference\",\"version\":106,\"autoload\":true,\"singular\":true,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"1\":{\"name\":\"FieldtypeTextarea\",\"title\":\"Textarea\",\"version\":107,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"27\":{\"name\":\"FieldtypeModule\",\"title\":\"Module Reference\",\"version\":101,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"220\":{\"name\":\"FieldtypeRepeater\",\"title\":\"Repeater\",\"version\":107,\"installs\":[\"InputfieldRepeater\"],\"autoload\":true,\"singular\":true,\"created\":1638272347,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\"},\"221\":{\"name\":\"InputfieldRepeater\",\"title\":\"Repeater\",\"version\":107,\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"created\":1638272347,\"namespace\":\"ProcessWire\\\\\"},\"111\":{\"name\":\"FieldtypePageTitle\",\"title\":\"Page Title\",\"version\":100,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"135\":{\"name\":\"FieldtypeURL\",\"title\":\"URL\",\"version\":101,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"84\":{\"name\":\"FieldtypeInteger\",\"title\":\"Integer\",\"version\":102,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"106\":{\"name\":\"FieldtypeFieldsetClose\",\"title\":\"Fieldset (Close)\",\"version\":100,\"singular\":1,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"225\":{\"name\":\"FieldtypeOptions\",\"title\":\"Select Options\",\"version\":2,\"singular\":1,\"created\":1638286561,\"namespace\":\"ProcessWire\\\\\"},\"133\":{\"name\":\"FieldtypePassword\",\"title\":\"Password\",\"version\":101,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"97\":{\"name\":\"FieldtypeCheckbox\",\"title\":\"Checkbox\",\"version\":101,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"89\":{\"name\":\"FieldtypeFloat\",\"title\":\"Flie\\u00dfkomma-Zahl\",\"version\":106,\"singular\":1,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"3\":{\"name\":\"FieldtypeText\",\"title\":\"Text\",\"version\":102,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"107\":{\"name\":\"FieldtypeFieldsetTabOpen\",\"title\":\"Fieldset in Tab (Open)\",\"version\":100,\"singular\":1,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"29\":{\"name\":\"FieldtypeEmail\",\"title\":\"E-Mail\",\"version\":101,\"singular\":true,\"namespace\":\"ProcessWire\\\\\"},\"28\":{\"name\":\"FieldtypeDatetime\",\"title\":\"Datetime\",\"version\":105,\"namespace\":\"ProcessWire\\\\\"},\"196\":{\"name\":\"AdminThemeUikit\",\"title\":\"Uikit\",\"version\":33,\"autoload\":\"template=admin\",\"created\":1522907965,\"configurable\":4,\"namespace\":\"ProcessWire\\\\\"},\"148\":{\"name\":\"AdminThemeDefault\",\"title\":\"Default\",\"version\":14,\"autoload\":\"template=admin\",\"configurable\":19,\"namespace\":\"ProcessWire\\\\\"},\"114\":{\"name\":\"PagePermissions\",\"title\":\"Page Permissions\",\"version\":105,\"autoload\":true,\"singular\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"85\":{\"name\":\"InputfieldInteger\",\"title\":\"Integer\",\"version\":105,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"108\":{\"name\":\"InputfieldURL\",\"title\":\"URL\",\"version\":102,\"namespace\":\"ProcessWire\\\\\"},\"40\":{\"name\":\"InputfieldHidden\",\"title\":\"Versteckt\",\"version\":101,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"90\":{\"name\":\"InputfieldFloat\",\"title\":\"Flie\\u00dfkommazahl\",\"version\":104,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"38\":{\"name\":\"InputfieldCheckboxes\",\"title\":\"Checkboxen\",\"version\":108,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"36\":{\"name\":\"InputfieldSelect\",\"title\":\"select-Auswahl\",\"version\":102,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"78\":{\"name\":\"InputfieldFieldset\",\"title\":\"Fieldset\",\"version\":101,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"56\":{\"name\":\"InputfieldImage\",\"title\":\"Bilder\",\"version\":124,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"35\":{\"name\":\"InputfieldTextarea\",\"title\":\"Textarea\",\"version\":103,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"55\":{\"name\":\"InputfieldFile\",\"title\":\"Dateien\",\"version\":126,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"224\":{\"name\":\"InputfieldToggle\",\"title\":\"Toggle\",\"version\":1,\"created\":1638273477,\"namespace\":\"ProcessWire\\\\\"},\"131\":{\"name\":\"InputfieldButton\",\"title\":\"Button\",\"version\":100,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"25\":{\"name\":\"InputfieldAsmSelect\",\"title\":\"asmSelect\",\"version\":202,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"60\":{\"name\":\"InputfieldPage\",\"title\":\"Page\",\"version\":107,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"80\":{\"name\":\"InputfieldEmail\",\"title\":\"E-Mail\",\"version\":101,\"namespace\":\"ProcessWire\\\\\"},\"86\":{\"name\":\"InputfieldPageName\",\"title\":\"Page Name\",\"version\":106,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"94\":{\"name\":\"InputfieldDatetime\",\"title\":\"Datum\\/Uhrzeit\",\"version\":107,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"155\":{\"name\":\"InputfieldCKEditor\",\"title\":\"CKEditor\",\"version\":168,\"installs\":[\"MarkupHTMLPurifier\"],\"created\":1406276777,\"namespace\":\"ProcessWire\\\\\"},\"34\":{\"name\":\"InputfieldText\",\"title\":\"Text\",\"version\":106,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"37\":{\"name\":\"InputfieldCheckbox\",\"title\":\"Checkbox\",\"version\":106,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"79\":{\"name\":\"InputfieldMarkup\",\"title\":\"Markup\",\"version\":102,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"43\":{\"name\":\"InputfieldSelectMultiple\",\"title\":\"Multi-select\",\"version\":101,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"178\":{\"name\":\"InputfieldIcon\",\"title\":\"Icon\",\"version\":3,\"created\":1434657976,\"namespace\":\"ProcessWire\\\\\"},\"39\":{\"name\":\"InputfieldRadios\",\"title\":\"Radio-Buttons\",\"version\":106,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"112\":{\"name\":\"InputfieldPageTitle\",\"title\":\"Page Title\",\"version\":102,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"122\":{\"name\":\"InputfieldPassword\",\"title\":\"Passwort\",\"version\":102,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"202\":{\"name\":\"InputfieldPageAutocomplete\",\"title\":\"Seiten-Autovervollst\\u00e4ndigung\",\"version\":112,\"created\":1552667852,\"namespace\":\"ProcessWire\\\\\"},\"149\":{\"name\":\"InputfieldSelector\",\"title\":\"Selector\",\"version\":28,\"autoload\":\"template=admin\",\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"addFlag\":32},\"32\":{\"name\":\"InputfieldSubmit\",\"title\":\"Submit\",\"version\":103,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"219\":{\"name\":\"InputfieldTextTags\",\"title\":\"Text Tags\",\"version\":5,\"icon\":\"tags\",\"created\":1638269633,\"namespace\":\"ProcessWire\\\\\"},\"30\":{\"name\":\"InputfieldForm\",\"title\":\"Formular\",\"version\":107,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"15\":{\"name\":\"InputfieldPageListSelect\",\"title\":\"Seitenbaum-Auswahl\",\"version\":101,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"137\":{\"name\":\"InputfieldPageListSelectMultiple\",\"title\":\"Multi-Seitenbaum-Auswahl\",\"version\":102,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"41\":{\"name\":\"InputfieldName\",\"title\":\"Name\",\"version\":100,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"50\":{\"name\":\"ProcessModule\",\"title\":\"Module\",\"version\":119,\"permission\":\"module-admin\",\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true,\"nav\":[{\"url\":\"?site#tab_site_modules\",\"label\":\"Site\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?site=1\"},{\"url\":\"?core#tab_core_modules\",\"label\":\"Core\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?core=1\"},{\"url\":\"?configurable#tab_configurable_modules\",\"label\":\"Configure\",\"icon\":\"gear\",\"navJSON\":\"navJSON\\/?configurable=1\"},{\"url\":\"?install#tab_install_modules\",\"label\":\"Install\",\"icon\":\"sign-in\",\"navJSON\":\"navJSON\\/?install=1\"},{\"url\":\"?new#tab_new_modules\",\"label\":\"New\",\"icon\":\"plus\"},{\"url\":\"?reset=1\",\"label\":\"Refresh\",\"icon\":\"refresh\"}]},\"48\":{\"name\":\"ProcessField\",\"title\":\"Felder\",\"version\":113,\"icon\":\"cube\",\"permission\":\"field-admin\",\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"136\":{\"name\":\"ProcessPermission\",\"title\":\"Berechtigungen\",\"version\":101,\"icon\":\"gear\",\"permission\":\"permission-admin\",\"singular\":1,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true},\"121\":{\"name\":\"ProcessPageEditLink\",\"title\":\"Page Edit Link\",\"version\":109,\"icon\":\"link\",\"permission\":\"page-edit\",\"singular\":1,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"177\":{\"name\":\"ProcessLogger\",\"title\":\"Logs\",\"version\":2,\"icon\":\"tree\",\"permission\":\"logs-view\",\"singular\":1,\"created\":1434657976,\"namespace\":\"ProcessWire\\\\\",\"useNavJSON\":true},\"150\":{\"name\":\"ProcessPageLister\",\"title\":\"Lister\",\"version\":26,\"icon\":\"search\",\"permission\":\"page-lister\",\"configurable\":true,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"87\":{\"name\":\"ProcessHome\",\"title\":\"Admin Start\",\"version\":101,\"permission\":\"page-view\",\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"68\":{\"name\":\"ProcessRole\",\"title\":\"Benutzerrollen\",\"version\":104,\"icon\":\"gears\",\"permission\":\"role-admin\",\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true},\"83\":{\"name\":\"ProcessPageView\",\"title\":\"Seitenansicht\",\"version\":104,\"permission\":\"page-view\",\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"104\":{\"name\":\"ProcessPageSearch\",\"title\":\"Page Search\",\"version\":106,\"permission\":\"page-edit\",\"singular\":1,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"12\":{\"name\":\"ProcessPageList\",\"title\":\"Page List\",\"version\":123,\"icon\":\"sitemap\",\"permission\":\"page-edit\",\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true},\"134\":{\"name\":\"ProcessPageType\",\"title\":\"Seitentyp\",\"version\":101,\"singular\":1,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"7\":{\"name\":\"ProcessPageEdit\",\"title\":\"Page Edit\",\"version\":110,\"icon\":\"edit\",\"permission\":\"page-edit\",\"singular\":1,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true},\"129\":{\"name\":\"ProcessPageEditImageSelect\",\"title\":\"Page Edit Image\",\"version\":120,\"permission\":\"page-edit\",\"singular\":1,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"76\":{\"name\":\"ProcessList\",\"title\":\"Liste\",\"version\":101,\"permission\":\"page-view\",\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"14\":{\"name\":\"ProcessPageSort\",\"title\":\"Seiten sortieren und verschieben\",\"version\":100,\"permission\":\"page-edit\",\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"66\":{\"name\":\"ProcessUser\",\"title\":\"Benutzer\",\"version\":107,\"icon\":\"group\",\"permission\":\"user-admin\",\"configurable\":\"ProcessUserConfig.php\",\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true},\"10\":{\"name\":\"ProcessLogin\",\"title\":\"Login\",\"version\":108,\"permission\":\"page-view\",\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"109\":{\"name\":\"ProcessPageTrash\",\"title\":\"Papierkorb (Seiten)\",\"version\":103,\"singular\":1,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"159\":{\"name\":\"ProcessRecentPages\",\"title\":\"Recent Pages\",\"version\":2,\"icon\":\"clock-o\",\"permission\":\"page-edit-recent\",\"singular\":1,\"created\":1426022416,\"namespace\":\"ProcessWire\\\\\",\"useNavJSON\":true,\"nav\":[{\"url\":\"?edited=1\",\"label\":\"Edited\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?edited=1\"},{\"url\":\"?added=1\",\"label\":\"Created\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?added=1\"},{\"url\":\"?edited=1&me=1\",\"label\":\"Edited by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?edited=1&me=1\"},{\"url\":\"?added=1&me=1\",\"label\":\"Created by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?added=1&me=1\"},{\"url\":\"another\\/\",\"label\":\"Add another\",\"icon\":\"plus-circle\",\"navJSON\":\"anotherNavJSON\\/\"}]},\"47\":{\"name\":\"ProcessTemplate\",\"title\":\"Templates\",\"version\":114,\"icon\":\"cubes\",\"permission\":\"template-admin\",\"configurable\":4,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true},\"17\":{\"name\":\"ProcessPageAdd\",\"title\":\"Seite hinzuf\\u00fcgen\",\"version\":108,\"icon\":\"plus-circle\",\"permission\":\"page-edit\",\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true,\"useNavJSON\":true},\"138\":{\"name\":\"ProcessProfile\",\"title\":\"Benutzer-Profil\",\"version\":105,\"permission\":\"profile-edit\",\"singular\":1,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\",\"permanent\":true},\"125\":{\"name\":\"SessionLoginThrottle\",\"title\":\"Session Login Throttle\",\"version\":103,\"autoload\":\"function\",\"singular\":true,\"configurable\":3,\"namespace\":\"ProcessWire\\\\\"},\"223\":{\"name\":\"InputfieldRepeaterMatrix\",\"title\":\"ProFields: Repeater Matrix Inputfield\",\"version\":5,\"requiresVersions\":{\"FieldtypeRepeaterMatrix\":[\">=\",0]},\"created\":1638273388},\"222\":{\"name\":\"FieldtypeRepeaterMatrix\",\"title\":\"ProFields: Repeater Matrix\",\"version\":5,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.98\"],\"FieldtypeRepeater\":[\">=\",104]},\"installs\":[\"InputfieldRepeaterMatrix\"],\"singular\":true,\"created\":1638273388,\"configurable\":3},\"205\":{\"name\":\"ProcessProCache\",\"title\":\"ProCache\",\"version\":318,\"icon\":\"fighter-jet\",\"requiresVersions\":{\"ProCache\":[\">=\",0]},\"singular\":1,\"created\":1555487452,\"namespace\":\"\\\\\"},\"204\":{\"name\":\"ProCache\",\"title\":\"ProCache\",\"version\":318,\"icon\":\"fighter-jet\",\"installs\":[\"ProcessProCache\"],\"autoload\":true,\"singular\":true,\"created\":1555487452,\"configurable\":true,\"namespace\":\"\\\\\"},\"211\":{\"name\":\"AppApi\",\"title\":\"AppApi\",\"version\":\"1.1.5\",\"icon\":\"terminal\",\"requiresVersions\":{\"PHP\":[\">=\",\"7.2.0\"],\"ProcessWire\":[\">=\",\"3.0.98\"]},\"autoload\":true,\"singular\":true,\"created\":1620840818,\"configurable\":\"AppApi.config.php\"},\"210\":{\"name\":\"ProcessCustomUploadNames\",\"title\":\"Custom Upload Names\",\"version\":\"1.3.1\",\"icon\":\"edit\",\"autoload\":true,\"singular\":true,\"created\":1620840781,\"configurable\":3,\"namespace\":\"\\\\\"},\"186\":{\"name\":\"ProcessDatabaseBackups\",\"title\":\"Database Backups\",\"version\":5,\"icon\":\"database\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.62\"]},\"permission\":\"db-backup\",\"created\":1435067558,\"nav\":[{\"url\":\".\\/\",\"label\":\"View\",\"icon\":\"list\"},{\"url\":\"backup\\/\",\"label\":\"Backup\",\"icon\":\"plus-circle\"},{\"url\":\"upload\\/\",\"label\":\"Upload\",\"icon\":\"cloud-upload\"}]}}', '2010-04-08 03:10:01');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__c2356877ccead4f97cfee8746ae6d5a8', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/ProCache.module\",\"hash\":\"5da132345fdf220e4c29f7a61ae43f1d\",\"size\":56433,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/ProCache.module\",\"hash\":\"b933014793cfa3e0e4a3b875672b89fc\",\"size\":58286,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__548e149226f1d6c4028549c68747771b', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProcessCustomUploadNames\\/ProcessCustomUploadNames.module.php\",\"hash\":\"705f5dee31940c76d32191dde04dd834\",\"size\":42867,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProcessCustomUploadNames\\/ProcessCustomUploadNames.module.php\",\"hash\":\"60312bbff78cf23d8f923df371cdc927\",\"size\":43803,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__723b0426ca2b34e16169ee7a899325f2', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/ProCacheBuster.php\",\"hash\":\"b5f228eac8d0ad0ff37196776058c9b5\",\"size\":6595,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/ProCacheBuster.php\",\"hash\":\"00622f699cc854d8571890658167b4f4\",\"size\":6608,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__73f2bef70c10a6c77983ab36bd047252', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/pwpc-func-ns.php\",\"hash\":\"30f84a0e49a9c38fce85ac280dfaf289\",\"size\":682,\"time\":1638269292,\"ns\":\"ProcessWire\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/pwpc-func-ns.php\",\"hash\":\"30f84a0e49a9c38fce85ac280dfaf289\",\"size\":682,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__346ffce206530957b5284cd8972ed4ef', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/pwpc-func.php\",\"hash\":\"235062cc170b365d38fed0cf2213e52f\",\"size\":635,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/pwpc-func.php\",\"hash\":\"dde5945b6a20cefc0d6c17a8e0f16429\",\"size\":674,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__49e73d6505e7be9be386df0963c4a3a4', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/ready.php\",\"hash\":\"163e73fd20d189301c1bebb7638ba987\",\"size\":1452,\"time\":1638269292,\"ns\":\"ProcessWire\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/ready.php\",\"hash\":\"163e73fd20d189301c1bebb7638ba987\",\"size\":1452,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__276675ba7d5076b01c8bef3fd3dc460d', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/templates\\/admin.php\",\"hash\":\"9636f854995462a4cb877cb1204bc2fe\",\"size\":467,\"time\":1638269292,\"ns\":\"ProcessWire\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/templates\\/admin.php\",\"hash\":\"9636f854995462a4cb877cb1204bc2fe\",\"size\":467,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__50a6314cff012b4a0e512bbc211d50a6', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/TextformatterBuster.module\",\"hash\":\"c83e6ca0eb47fa8171d14a74fc34e408\",\"size\":5949,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/TextformatterBuster.module\",\"hash\":\"4501be111d345452883433134bef8afa\",\"size\":6001,\"time\":1638269292}}', '2010-04-08 03:10:10');
INSERT INTO `caches` (`name`, `data`, `expires`) VALUES('FileCompiler__18a644eb1cd246e75c11ea095c9e89b5', '{\"source\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/modules\\/ProCache\\/ProcessProCache.module\",\"hash\":\"f40f360e8fa6a5510577169c8da06de1\",\"size\":59312,\"time\":1638269292,\"ns\":\"\\\\\"},\"target\":{\"file\":\"\\/Users\\/nadineprigann\\/Documents\\/work\\/nadine prigann\\/projects\\/permaculture almanac\\/Entwicklung\\/permaculture-almanac\\/backend\\/dist\\/site\\/assets\\/cache\\/FileCompiler\\/site\\/modules\\/ProCache\\/ProcessProCache.module\",\"hash\":\"1cc2f6f42189217fe8dc5dff4dd12550\",\"size\":60205,\"time\":1638269292}}', '2010-04-08 03:10:10');

DROP TABLE IF EXISTS `field_admin_theme`;
CREATE TABLE `field_admin_theme` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_admin_theme` (`pages_id`, `data`) VALUES('41', '196');

DROP TABLE IF EXISTS `field_author`;
CREATE TABLE `field_author` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_author` (`pages_id`, `data`, `sort`) VALUES('1051', '1055', '0');
INSERT INTO `field_author` (`pages_id`, `data`, `sort`) VALUES('1100', '1058', '0');
INSERT INTO `field_author` (`pages_id`, `data`, `sort`) VALUES('1091', '1086', '0');
INSERT INTO `field_author` (`pages_id`, `data`, `sort`) VALUES('1105', '1110', '0');
INSERT INTO `field_author` (`pages_id`, `data`, `sort`) VALUES('1105', '1111', '1');
INSERT INTO `field_author` (`pages_id`, `data`, `sort`) VALUES('1113', '1117', '0');
INSERT INTO `field_author` (`pages_id`, `data`, `sort`) VALUES('1118', '1119', '0');

DROP TABLE IF EXISTS `field_body`;
CREATE TABLE `field_body` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1104', '<p>This website aims to create a central space for permacultural resources that will, with the help of the community, grow more profound with every entry, thus creating a thorough and valuable tool for everyone working with and studying permaculture with all its facets.</p>\n\n<p>Additionally, it is intended to turn this website itself into a resource through representing a playground for best and experimental practices to create sustainable and inclusive web development, also in compliance with the <a href=\"https://www.sustainablewebmanifesto.com/\" target=\"_blank\" rel=\"noreferrer noopener\">Sustainable Web Manifesto</a>. To extend the already existing concepts, permacultural approaches and design methods will be used.<br /><br />\nSpecifically, the site was built with an ecological and sustainable approach to keep its footprint low in as many aspects as possible.Therefore, a minimal amount of data fetching from external sites as well as the own server was implemented. To be able to sustain this, nor images neither videos are implemented on this site. Instead, only text is used and the visitor is, for instance, linked to an external site which already hosts the requested information. Also, the design only works with micro transitions. Nothing fancy, nothing flashy. It\'s about the information, not unnecessary traffic.<br /><br />\nFurthermore, this page is only available in English. Firstly, to be able to renounce complex and cost-effective (in terms of resource usage) internationalization and secondly, to be as inclusive to visitors from all over the world as possible.</p>\n\n\n\n<p>https://utopia.de/ratgeber/gruenes-webhosting-oekostrom/<br /><br />\nThis project was made by Nadine Prigann and is available on <a href=\"https://github.com/npnpnpnpnpnp/permaculture-almanac\" target=\"_blank\" rel=\"noreferrer noopener\">GitHub</a> free to use.</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1105', '<p>Gabe Brown of Brown\'s Ranch in Bismarck, ND, shares his transformative journey of cultivating his farm from modern conventional use to a thriving living ecosystem. Through no-till and extensive cover crop usage, Gabe and his family are able to support a diverse array of farm and ranching enterprises that are both profitable and models of sustainability in regenerative agriculture. Learn more at www.brownsranch.us</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1111', '<p>Farmer from Bismarck, North Dakota, United States who changed from \"conventional farming\" to regenerative agriculture. He is now advocating for a more regenerative approach towards farming with no synthetic additives and the no-till method. Also working as a speaker.</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1112', '<p>Schon seit 1994 setzt sich SUS für den fachgerechten Bau von Trockenmauern ein. Die Stiftung zeichnet sich durch ihre besondere Kompetenz in allen Fragen des Trockenmauerbaus aus.</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1113', '<p>Beschreibung des Buches hier. Beschreibung des Buches hier. Beschreibung des Buches hier. Beschreibung hier. Beschreibung des Buches hier. Beschreibung des Buches hier. Beschreibung des Buches hier. Beschreibung hier. Beschreibung des Buches hier. Be</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1118', '<p>SARE works to increase knowledge about—and help farmers and ranchers adopt—practices that are profitable, environ- mentally sound and good for communities. Published 2007.</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1120', '<p>Hier sollte villeicht das template umbenannt werden in sowas wie project / initiative / institution. Ein Format, unter dem man alle Höfe, Projekte, Initiativen und Institutionen zusammenfassen kann.</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1086', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br /><br /><a href=\"http://www.kreislauf-gaerten.de/\" target=\"_blank\" rel=\"noreferrer noopener\">www.kreislauf-gaerten.de</a></p>');

DROP TABLE IF EXISTS `field_content`;
CREATE TABLE `field_content` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_email` (`pages_id`, `data`) VALUES('41', '');

DROP TABLE IF EXISTS `field_external_url`;
CREATE TABLE `field_external_url` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1051', 'http://www.kernobstschnitt.de');
INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1091', 'https://oekobuch.de/');
INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1099', 'https://nesrin.de');
INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1100', 'https://www.youtube.com/watch?v=F3ZhPM8wQjY');
INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1105', 'https://www.youtube.com/watch?v=uUmIdq0D6-A');
INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1111', 'http://www.brownsranch.us');
INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1112', 'https://www.umwelteinsatz.ch/');
INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1113', 'http://www.pala-verlag.de');
INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1118', 'https://www.sare.org/wp-content/uploads/Managing-Cover-Crops-Profitably.pdf');
INSERT INTO `field_external_url` (`pages_id`, `data`) VALUES('1120', 'https://www.agroforstkampagne.net/');

DROP TABLE IF EXISTS `field_external_url_title`;
CREATE TABLE `field_external_url_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_external_url_title` (`pages_id`, `data`) VALUES('1099', 'www.nesrin.de');
INSERT INTO `field_external_url_title` (`pages_id`, `data`) VALUES('1111', 'www.brownsranch.us');

DROP TABLE IF EXISTS `field_host`;
CREATE TABLE `field_host` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_host` (`pages_id`, `data`, `sort`) VALUES('1051', '1', '0');
INSERT INTO `field_host` (`pages_id`, `data`, `sort`) VALUES('1100', '1', '0');
INSERT INTO `field_host` (`pages_id`, `data`, `sort`) VALUES('1105', '1', '0');

DROP TABLE IF EXISTS `field_image`;
CREATE TABLE `field_image` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
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
  `filesize` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_isbn`;
CREATE TABLE `field_isbn` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_isbn` (`pages_id`, `data`) VALUES('1091', '978-3-936896-90-9');
INSERT INTO `field_isbn` (`pages_id`, `data`) VALUES('1113', '978-3-89566-249-2');

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
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpageclone-module.json', '134', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpageadd--processpageadd-module.json', '133', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processmodule--processmoduleinstall-php.json', '132', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processmodule--processmodule-module.json', '131', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processlogin--processlogin-module.json', '130', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processlogger--processlogger-module.json', '129', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processlist-module.json', '128', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processhome-module.json', '127', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processforgotpassword-module.json', '126', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processfield--processfieldexportimport-php.json', '125', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processfield--processfield-module.json', '124', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processcommentsmanager--processcommentsmanager-module.json', '123', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--pagerender-module.json', '122', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--pagepaths-module.json', '121', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--page--pagefrontedit--pagefronteditconfig-php.json', '120', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--page--pagefrontedit--pagefrontedit-module.json', '119', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--markup--markuppagernav--markuppagernav-module.json', '118', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--markup--markuppagefields-module.json', '117', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--languagesupport--processlanguage-module.json', '116', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--languagesupport--languagetranslator-php.json', '115', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--languagesupport--languagetabs-module.json', '114', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--languagesupport--languagesupportpagenames-module.json', '113', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--languagesupport--languagesupportinstall-php.json', '112', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--languagesupport--languagesupportfields-module.json', '111', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--languagesupport--languagesupport-module.json', '110', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--languagesupport--languageparser-php.json', '109', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--jquery--jquerywiretabs--jquerywiretabs-module.json', '108', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--jquery--jqueryui--jqueryui-module.json', '107', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldurl-module.json', '106', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldtext-module.json', '104', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldtextarea-module.json', '105', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldsubmit--inputfieldsubmit-module.json', '103', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldselector--inputfieldselector-module.json', '102', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldselectmultiple-module.json', '101', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldselect-module.json', '100', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldradios--inputfieldradios-module.json', '99', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldpassword--inputfieldpassword-module.json', '98', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagetitle--inputfieldpagetitle-module.json', '97', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagetable--inputfieldpagetableajax-php.json', '96', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagetable--inputfieldpagetable-module.json', '95', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagename--inputfieldpagename-module.json', '94', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagelistselect--inputfieldpagelistselectmultiple-module.json', '93', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldpagelistselect--inputfieldpagelistselect-module.json', '92', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldpageautocomplete--inputfieldpageautocomplete-module.json', '91', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldpage--inputfieldpage-module.json', '90', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldname-module.json', '89', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldmarkup-module.json', '88', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldinteger-module.json', '87', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldimage--inputfieldimage-module.json', '86', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldicon--inputfieldicon-module.json', '85', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldhidden-module.json', '84', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldform-module.json', '83', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldfloat-module.json', '82', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldfile--inputfieldfile-module.json', '81', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldfieldset-module.json', '80', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldemail-module.json', '79', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfielddatetime--inputfielddatetime-module.json', '78', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldckeditor--inputfieldckeditor-module.json', '77', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldcheckboxes--inputfieldcheckboxes-module.json', '76', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldcheckbox-module.json', '75', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldbutton-module.json', '74', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--inputfield--inputfieldasmselect--inputfieldasmselect-module.json', '73', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--image--imagesizerengineanimatedgif--imagesizerengineanimatedgif-module.json', '72', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--filecompilertags-module.json', '71', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeurl-module.json', '70', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypetextareahelper-php.json', '69', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypetext-module.json', '68', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeselector-module.json', '67', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--inputfieldrepeater-module.json', '66', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--fieldtyperepeater-module.json', '65', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--fieldtypefieldsetpage-module.json', '64', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--fieldsetpageinstructions-php.json', '63', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtyperepeater--config-php.json', '62', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypepagetable-module.json', '61', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypepage-module.json', '60', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeoptions--selectableoptionmanager-php.json', '59', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeoptions--selectableoptionconfig-php.json', '58', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeoptions--fieldtypeoptions-module.json', '57', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypemodule-module.json', '56', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypeinteger-module.json', '55', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypefloat-module.json', '54', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypefile-module.json', '53', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypefieldsettabopen-module.json', '52', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypedatetime-module.json', '51', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--inputfieldcommentsadmin-module.json', '50', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--fieldtypecomments-module.json', '49', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentstars-php.json', '48', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentnotifications-php.json', '47', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentlist-php.json', '46', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentform-php.json', '45', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--fieldtype--fieldtypecomments--commentfilterakismet-module.json', '44', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--config-php.json', '43', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--adminthemeuikit-module.json', '42', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--_sidenav-masthead-php.json', '41', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--_masthead-php.json', '40', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemeuikit--_footer-php.json', '39', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemereno--default-php.json', '38', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemereno--debug-inc.json', '37', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemereno--adminthemerenohelpers-php.json', '36', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemereno--adminthemereno-module.json', '35', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--admintheme--adminthemedefault--adminthemedefault-module.json', '34', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--wireupload-php.json', '33', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--wireshutdown-php.json', '32', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--wirehttp-php.json', '31', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--wiredatetime-php.json', '30', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--wirecache-php.json', '29', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--sessioncsrf-php.json', '28', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--session-php.json', '27', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--process-php.json', '25', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--sanitizer-php.json', '26', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--permissions-php.json', '24', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--password-php.json', '23', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--paginatedarray-php.json', '22', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--pagesexportimport-php.json', '21', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--pageseditor-php.json', '20', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--pageimage-php.json', '19', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--modulesduplicates-php.json', '18', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--modules-php.json', '17', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--markupqa-php.json', '16', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--inputfieldwrapper-php.json', '15', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--inputfield-php.json', '14', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--imagesizerengine-php.json', '13', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--functions-php.json', '12', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--filevalidatormodule-php.json', '11', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--filecompilermodule-php.json', '10', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--filecompiler-php.json', '9', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--fieldtype-php.json', '7', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--fieldtypemulti-php.json', '8', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--fieldselectorinfo-php.json', '6', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--fields-php.json', '5', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--fieldgroups-php.json', '4', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--adminthemeframework-php.json', '2', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--field-php.json', '3', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--admintheme-php.json', '1', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--core--admin-php.json', '0', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpageedit--pagebookmarks-php.json', '135', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpageedit--processpageedit-module.json', '136', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpageeditimageselect--processpageeditimageselect-module.json', '137', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpageeditlink--processpageeditlink-module.json', '138', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagelist--processpagelist-module.json', '139', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagelist--processpagelistactions-php.json', '140', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagelist--processpagelistrender-php.json', '141', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagelist--processpagelistrenderjson-php.json', '142', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagelister--processpagelister-module.json', '143', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagelister--processpagelisterbookmarks-php.json', '144', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagesearch--processpagesearch-module.json', '145', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagesexportimport--processpagesexportimport-module.json', '146', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagesort-module.json', '147', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagetrash-module.json', '148', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpagetype--processpagetype-module.json', '149', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpageview-module.json', '150', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processpermission--processpermission-module.json', '151', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processprofile--processprofile-module.json', '152', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processrecentpages--processrecentpages-module.json', '153', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processrole--processrole-module.json', '154', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processtemplate--processtemplate-module.json', '155', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processtemplate--processtemplateexportimport-php.json', '156', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processuser--processuser-module.json', '157', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--process--processuser--processuserconfig-php.json', '158', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--session--sessionhandlerdb--processsessiondb-module.json', '159', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--session--sessionhandlerdb--sessionhandlerdb-module.json', '160', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--session--sessionloginthrottle--sessionloginthrottle-module.json', '161', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--system--systemnotifications--systemnotifications-module.json', '162', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--system--systemnotifications--systemnotificationsconfig-php.json', '163', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--system--systemupdater--systemupdater-module.json', '164', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--textformatter--textformatterentities-module.json', '165', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--textformatter--textformattermarkdownextra--textformattermarkdownextra-module.json', '166', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--modules--textformatter--textformattersmartypants--textformattersmartypants-module.json', '167', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--templates-admin--debug-inc.json', '168', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`) VALUES('1013', 'wire--templates-admin--default-php.json', '169', '[null]', '2019-03-08 17:03:48', '2019-03-08 17:03:48', '', NULL, '0', '0');

DROP TABLE IF EXISTS `field_language_files_site`;
CREATE TABLE `field_language_files_site` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int(11) DEFAULT NULL,
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
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

INSERT INTO `field_pass` (`pages_id`, `data`, `salt`) VALUES('41', 'sPRVivsR56OCJI9azqYrFlwVEPC4bWG', '$2y$11$waPLl1Y82Tj89BT3q47TYe');
INSERT INTO `field_pass` (`pages_id`, `data`, `salt`) VALUES('40', '', '');

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '32', '1');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '34', '2');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '35', '3');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('37', '36', '0');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '36', '0');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '50', '4');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '51', '5');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '52', '7');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '53', '8');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '54', '6');

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
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1049', '211');

DROP TABLE IF EXISTS `field_publisher`;
CREATE TABLE `field_publisher` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_publisher` (`pages_id`, `data`) VALUES('1091', 'Ökobuch');
INSERT INTO `field_publisher` (`pages_id`, `data`) VALUES('1113', 'pala-verlag');
INSERT INTO `field_publisher` (`pages_id`, `data`) VALUES('1118', 'Sustainable Agriculture Research and Education');

DROP TABLE IF EXISTS `field_repeater_matrix_type`;
CREATE TABLE `field_repeater_matrix_type` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_role`;
CREATE TABLE `field_role` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_role` (`pages_id`, `data`) VALUES('1099', 'Beratung, Gestaltung, Kurse');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('40', '37', '0');
INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('41', '37', '0');
INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('41', '38', '2');

DROP TABLE IF EXISTS `field_subtitle`;
CREATE TABLE `field_subtitle` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1091', 'Von der Planung zur Umsetzung');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1105', 'Part 1: The 5 Tenets of Soil Health');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1112', 'Stiftung Umwelteinsatz Schweiz');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1113', 'Bauanleitung, Gestaltung, Naturschutz');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1118', 'Third Edition');
INSERT INTO `field_subtitle` (`pages_id`, `data`) VALUES('1120', 'Die Brücke zwischen Landwirten, Forschung und Politik.');

DROP TABLE IF EXISTS `field_tags`;
CREATE TABLE `field_tags` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1051', '1056', '0');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1105', '1056', '7');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1051', '1057', '1');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1105', '1057', '0');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1118', '1057', '1');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1091', '1094', '0');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1099', '1094', '0');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1091', '1095', '1');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1091', '1096', '2');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1091', '1097', '3');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1100', '1101', '0');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1105', '1101', '1');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1118', '1101', '0');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1100', '1102', '1');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1105', '1102', '2');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1118', '1102', '3');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1105', '1106', '3');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1105', '1107', '4');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1105', '1108', '5');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1105', '1109', '6');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1118', '1109', '2');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1113', '1114', '0');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1113', '1115', '1');
INSERT INTO `field_tags` (`pages_id`, `data`, `sort`) VALUES('1113', '1116', '2');

DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
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
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Permaculture Almanac');
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
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1042', 'Resources');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1044', 'API');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1045', 'ProCache');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1049', 'AppApi');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1050', 'Manage AppApi settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1051', 'Obstbaumschnitt bei Kernobst');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1052', 'Authors');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1053', 'Tags');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1118', 'Managing Cover Crops Profitably');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1055', 'Dominik Schreiber');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1056', 'Obstbaumschnitt');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1057', 'Gründüngung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1058', 'Peter Meier');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1060', 'Repeaters');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1104', 'About');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1101', 'Bodenverbesserung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1119', 'Sustainable Agriculture Research and Education (SARE)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1102', 'Mulch');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1067', 'media');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1100', 'Bodenverbesserung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1096', 'Zonierung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1095', 'Planung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1094', 'Permakultur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1091', 'Permakultur im Hausgarten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1105', 'Treating the Farm as an Ecosystem');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1086', 'Jonas Gampe');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1097', 'Sektionierung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1099', 'Nesrin Caglak');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1106', 'Weideland');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1107', 'Pasture');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1108', 'No-Till');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1109', 'Regenerative Agriculture');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1110', 'Living Web Farms');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1111', 'Gabe Brown');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1112', 'SUS');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1113', 'Lebensraum Trockenmauer');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1114', 'Naturschutz');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1115', 'Trockenmauer');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1116', 'Handwerk');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1117', 'Sofie Meys');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1120', 'Agroforstkampagne');

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('99', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('97', 'language');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('98', 'http-status');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('100', 'api');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('101', 'resources');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('102', 'resource');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('103', 'authors');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('104', 'tags');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('105', 'media_types');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('106', 'author');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('107', 'tag');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('108', 'media_type');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('122', 'search');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('115', 'repeater_content');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('116', 'video');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('117', 'publication');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('118', 'person');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('119', 'podcast');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('120', 'institution');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('121', 'tool');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fields_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '105', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '99', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '102', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '97', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '101', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '101', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '101', '7', '{\"label\":\"Beschreibung\",\"label1039\":\"Description\",\"maxlength\":250}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '111', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '107', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '101', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '110', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '121', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('120', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('120', '122', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '107', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '122', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '110', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '106', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '115', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '114', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '122', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '110', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '106', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '101', '4', '{\"label\":\"Beschreibung\",\"label1039\":\"Description\",\"maxlength\":250}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('120', '101', '3', '{\"maxlength\":250}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '106', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '107', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '106', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '121', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '114', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '101', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '110', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '122', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '115', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '2', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '98', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '120', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '107', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '129', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '121', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '110', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('122', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '110', '2', '{\"description\":\"Link des Videos\",\"description1039\":\"Link of video\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('121', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('121', '101', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('121', '121', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('121', '110', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '128', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '101', '6', '{\"label\":\"Beschreibung\",\"label1039\":\"Description\",\"maxlength\":250}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '122', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('120', '110', '2', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Titel', '{\"required\":1,\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":255,\"label1039\":\"Title\",\"minlength\":0,\"showCount\":0,\"langBlankInherit\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"permanent\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail-Adresse', '{\"size\":70,\"maxlength\":255,\"label1039\":\"E-Mail Address\",\"collapsed\":0,\"minlength\":0,\"showCount\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeFile', 'language_files_site', '24', 'Site Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for translations specific to your site (like files in \\/site\\/templates\\/ for example).\",\"descriptionRows\":0,\"fileSchema\":14}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('98', 'FieldtypeFile', 'language_files', '24', 'Core Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for [language packs](http:\\/\\/modules.processwire.com\\/categories\\/language-pack\\/). To delete all files, double-click the trash can for any file, then save.\",\"descriptionRows\":0,\"fileSchema\":14}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('99', 'FieldtypePage', 'language', '24', 'Language', '{\"derefAsPage\":1,\"parent_id\":1012,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldRadios\",\"required\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('101', 'FieldtypeTextarea', 'body', '0', 'Text', '{\"inputfieldClass\":\"InputfieldCKEditor\",\"contentType\":1,\"rows\":5,\"toolbar\":\"Styles\\nRemoveFormat\\nBold, Italic\\nPWLink, Unlink\\nNumberedList, BulletedList\",\"inlineMode\":0,\"useACF\":1,\"usePurifier\":1,\"toggles\":[2,4,8],\"formatTags\":\"p;h1;h2;h3;h4;h5;h6;pre;address\",\"extraPlugins\":[\"pwlink\"],\"removePlugins\":\"image,magicline\",\"collapsed\":0,\"label1039\":\"Body\",\"minlength\":0,\"showCount\":1,\"contentsInlineCss\":\"\\/site\\/modules\\/InputfieldCKEditor\\/contents-inline_custom.css\",\"stylesSet\":\"mystyles_custom:\\/site\\/modules\\/InputfieldCKEditor\\/mystyles_custom.js\",\"imageFields\":[\"x\"],\"htmlOptions\":[2],\"maxlength\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('102', 'FieldtypeText', 'meta_description', '0', 'Meta description', '{\"description\":\"Zusammenfassung des Seiteninhalts f\\u00fcr Suchmaschinen\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":2,\"size\":0,\"maxlength\":155,\"minlength\":0,\"showCount\":1,\"description1039\":\"Abstract of page content for search engines\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('103', 'FieldtypeImage', 'image', '0', 'Bild', '{\"textformatters\":[\"TextformatterEntities\"],\"extensions\":\"jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":0,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"overwrite\":1,\"descriptionRows\":1,\"gridMode\":\"left\",\"maxReject\":0,\"fileSchema\":270,\"label1039\":\"Image\",\"dimensionsByAspectRatio\":1,\"useTags\":0,\"focusMode\":\"off\",\"resizeServer\":0,\"clientQuality\":90,\"maxSize\":4,\"minWidth\":1600,\"minHeight\":1000}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('104', 'FieldtypeImage', 'images', '0', 'Bilder', '{\"textformatters\":[\"TextformatterEntities\"],\"extensions\":\"jpg jpeg png svg\",\"maxFiles\":0,\"outputFormat\":0,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"descriptionRows\":1,\"gridMode\":\"left\",\"maxReject\":0,\"fileSchema\":270,\"label1039\":\"Images\",\"dimensionsByAspectRatio\":1,\"useTags\":0,\"focusMode\":\"off\",\"resizeServer\":0,\"clientQuality\":90,\"maxSize\":4,\"minWidth\":1600,\"minHeight\":1000}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('105', 'FieldtypeModule', 'admin_theme', '8', 'Admin Theme', '{\"moduleTypes\":[\"AdminTheme\"],\"labelField\":\"title\",\"inputfieldClass\":\"InputfieldRadios\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('106', 'FieldtypePage', 'author', '0', 'author', '{\"label1039\":\"author\",\"derefAsPage\":0,\"inputfield\":\"InputfieldAsmSelect\",\"parent_id\":1052,\"labelFieldName\":\"title\",\"collapsed\":0,\"addable\":1,\"template_id\":52,\"size\":10}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('107', 'FieldtypePage', 'tags', '0', 'tags', '{\"label1039\":\"tags\",\"derefAsPage\":0,\"inputfield\":\"InputfieldAsmSelect\",\"parent_id\":1053,\"labelFieldName\":\"title\",\"collapsed\":0,\"template_id\":53,\"addable\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('110', 'FieldtypeURL', 'external_url', '0', 'Externe URL', '{\"label1039\":\"External URL\",\"textformatters\":[\"TextformatterEntities\"],\"noRelative\":1,\"allowIDN\":0,\"allowQuotes\":0,\"addRoot\":0,\"collapsed\":0,\"minlength\":0,\"maxlength\":1024,\"showCount\":0,\"size\":0,\"columnWidth\":50}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('111', 'FieldtypeInteger', 'repeater_matrix_type', '25', 'Repeater matrix type', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('114', 'FieldtypeText', 'isbn', '0', 'isbn', '{\"label1039\":\"isbn\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"columnWidth\":50,\"pattern\":\"(?=.{17}$)97[89]-(?:[0-9]+-){2}[0-9]+-[0-9]\",\"description\":\"Enter in the format 123-4-567890-12-3.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('115', 'FieldtypeText', 'publisher', '0', 'publisher', '{\"label1039\":\"publisher\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"columnWidth\":50,\"description\":\"Name of publisher\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('129', 'FieldtypeText', 'role', '0', 'role', '{\"label1039\":\"role\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('120', 'FieldtypeRepeaterMatrix', 'content', '0', 'content', '{\"label1039\":\"content\",\"template_id\":61,\"parent_id\":1067,\"matrix1_name\":\"type_video\",\"matrix1_label\":\"video\",\"matrix1_head\":\"{matrix_label} [\\u2022 {matrix_summary}]\",\"matrix1_label1039\":\"video\",\"matrix1_fields\":{\"1\":106,\"2\":110,\"3\":109},\"matrix1_sort\":0,\"matrix2_name\":\"type_publication\",\"matrix2_label\":\"publication\",\"matrix2_head\":\"{matrix_label} [\\u2022 {matrix_summary}]\",\"matrix2_label1039\":\"publication\",\"matrix2_fields\":{\"1\":122,\"2\":106,\"3\":115,\"4\":121,\"5\":110,\"6\":114},\"matrix2_sort\":1,\"matrix3_name\":\"type_person\",\"matrix3_label\":\"person\",\"matrix3_head\":\"{matrix_label} [\\u2022 {matrix_summary}]\",\"matrix3_label1039\":\"person\",\"matrix3_fields\":[106,110],\"matrix3_sort\":2,\"matrix4_name\":\"type_podcast\",\"matrix4_label\":\"podcast\",\"matrix4_head\":\"{matrix_label} [\\u2022 {matrix_summary}]\",\"matrix4_label1039\":\"podcast\",\"matrix4_fields\":{\"1\":106,\"2\":110},\"matrix4_sort\":3,\"matrix5_name\":\"type_institution\",\"matrix5_label\":\"institution\",\"matrix5_head\":\"{matrix_label} [\\u2022 {matrix_summary}]\",\"matrix5_label1039\":\"institution\",\"matrix5_fields\":{\"1\":101,\"2\":110},\"matrix5_sort\":4,\"repeaterFields\":{\"0\":111,\"2\":106,\"3\":110,\"4\":109,\"5\":122,\"6\":115,\"7\":121,\"8\":114,\"9\":101},\"repeaterCollapse\":3,\"repeaterLoading\":1,\"familyFriendly\":0,\"repeaterMaxItems\":1,\"matrix6_name\":\"type_tool\",\"matrix6_label\":\"tool\",\"matrix6_head\":\"{matrix_label} [\\u2022 {matrix_summary}]\",\"matrix6_label1039\":\"tool\",\"matrix6_fields\":{\"1\":101,\"2\":110},\"matrix6_sort\":5,\"collapsed\":2}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('121', 'FieldtypeText', 'external_url_title', '0', 'Link-Titel', '{\"label1039\":\"Link title\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"columnWidth\":50}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('122', 'FieldtypeText', 'subtitle', '0', 'subtitle', '{\"label1039\":\"subtitle\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('128', 'FieldtypeOptions', 'host', '0', 'host', '{\"label1039\":\"host\",\"inputfieldClass\":\"InputfieldSelect\",\"collapsed\":0,\"columnWidth\":50}');

DROP TABLE IF EXISTS `fieldtype_options`;
CREATE TABLE `fieldtype_options` (
  `fields_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `title` text,
  `value` varchar(250) DEFAULT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fields_id`,`option_id`),
  UNIQUE KEY `title` (`title`(250),`fields_id`),
  KEY `value` (`value`,`fields_id`),
  KEY `sort` (`sort`,`fields_id`),
  FULLTEXT KEY `title_ft` (`title`),
  FULLTEXT KEY `value_ft` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('128', '1', 'YouTube', '', '0');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('128', '2', 'Vimeo', '', '1');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('128', '3', 'Other', '', '2');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('220', 'FieldtypeRepeater', '35', '{\"repeatersRootPageID\":1060,\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2021-11-30 12:39:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '3', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('30', 'InputfieldForm', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('6', 'FieldtypeFile', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('7', 'ProcessPageEdit', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('10', 'ProcessLogin', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('12', 'ProcessPageList', '0', '{\"pageLabelField\":\"title\",\"paginationLimit\":25,\"limit\":50}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '{\"classOptions\":\"\",\"relOptions\":\"nofollow\\nnoopener\",\"targetOptions\":\"_blank\",\"extLinkClass\":\"\",\"extLinkRel\":\"noopener\",\"extLinkTarget\":\"_blank\",\"urlType\":\"0\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '0000-00-00 00:00:00');
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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":19,\"coreVersion\":\"3.0.184\"}', '0000-00-00 00:00:00');
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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('210', 'ProcessCustomUploadNames', '3', '', '2021-05-12 19:33:01');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('211', 'AppApi', '3', '{\"endpoint\":\"api\",\"routes_path\":\"site\\/templates\\/api\\/Routes.php\",\"access_logging\":\"\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2021-05-12 19:33:38');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('202', 'InputfieldPageAutocomplete', '0', '', '2019-03-15 17:37:32');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('204', 'ProCache', '3', '{\"licenseKey\":\"PWPC3.per2284.af9b22291fe60c0807c9824f91cd3452daa1c1c5\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\",\"cacheOn\":false,\"debug\":\"0\",\"cacheTime\":31449600,\"cacheTimeCustom\":\"\",\"cacheClear\":[4],\"cacheClearCustom\":\"\",\"htAllow\":\"1\",\"minifyTemplates\":[],\"minifyIgnoreTags\":\"textarea pre\",\"minifyBlocks\":\"!doctype address article aside audio blockquote body br button canvas caption col colgroup dd div dl dt embed fieldset figcaption figure footer form h1 h2 h3 h4 h5 h6 head header hgroup hr html li link main map meta nav noscript object ol optgroup option output p pre progress script section table tbody td tfoot th thead title tr ul video\",\"minifyRemoveBlankAttr\":\"class dir for id lang style title\",\"minifyOptions\":[],\"minifyHTMLOptions\":[\"js\",\"css\",\"uncomment\",\"noXHTML\",\"unblank\",\"untag\",\"unattr\",\"unbool\",\"unquote\"],\"minifyMaxImportCSS\":5,\"noCacheCookies\":\"wire_challenge\\nwires_challenge\",\"noCacheGetVars\":\"*\",\"urlSegments\":\"4\",\"https\":\"\",\"cacheHosts\":[],\"bodyClass\":\"\",\"canonical\":\"0\",\"docRootPath\":\"\",\"busterUrlType\":\"qstr\",\"cdnHosts\":\"\",\"cdnExts\":\"\",\"cdnAttrs\":\"src srcset href\",\"cdnTemplates\":[],\"cdnStatus\":\"0\",\"cacheTemplates\":[]}', '2019-04-17 09:50:52');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('205', 'ProcessProCache', '1', '', '2019-04-17 09:50:52');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('172', 'MarkupCache', '3', '', '2015-03-11 09:12:57');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('173', 'MaintenanceMode', '67', '{\"inMaintenance\":\"\",\"bypassRoles\":[],\"showPage\":1019,\"showURL\":\"\",\"allowPages\":[]}', '2015-03-11 09:13:11');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('177', 'ProcessLogger', '1', '', '2015-06-18 22:06:16');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('178', 'InputfieldIcon', '0', '', '2015-06-18 22:06:16');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('186', 'ProcessDatabaseBackups', '0', '', '2015-06-23 15:52:38');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('196', 'AdminThemeUikit', '10', '{\"useAsLogin\":1,\"userAvatar\":\"icon.user-circle\",\"userLabel\":\"{Name}\",\"logoAction\":\"0\",\"layout\":\"\",\"maxWidth\":1600,\"groupNotices\":\"1\",\"cssURL\":\"\",\"logoURL\":\"\",\"noBorderTypes\":[],\"offsetTypes\":[]}', '2018-04-05 07:59:25');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('197', 'ImageSizerEngineIMagick', '0', '', '2018-04-05 08:00:28');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('198', 'ImageSizerEngineAnimatedGif', '0', '', '2018-04-05 08:00:35');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('219', 'InputfieldTextTags', '0', '', '2021-11-30 11:53:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('221', 'InputfieldRepeater', '0', '', '2021-11-30 12:39:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('222', 'FieldtypeRepeaterMatrix', '33', '{\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2021-11-30 12:56:28');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('223', 'InputfieldRepeaterMatrix', '0', '', '2021-11-30 12:56:28');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('224', 'InputfieldToggle', '0', '', '2021-11-30 12:57:57');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('225', 'FieldtypeOptions', '1', '', '2021-11-30 16:36:01');

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
) ENGINE=MyISAM AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2021-12-13 16:57:23', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'manage', '1035', '2021-11-30 11:25:31', '40', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2011-03-29 21:37:06', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2015-11-02 15:57:07', '40', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2011-08-14 22:04:52', '41', '2010-02-07 05:29:39', '2', '2010-02-07 05:29:39', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2018-04-05 07:57:22', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2011-03-29 21:37:06', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2015-12-15 15:04:30', '40', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2011-03-29 21:37:06', '41', '2010-02-01 11:04:54', '2', '2010-02-01 11:04:54', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2011-03-29 21:37:06', '41', '2010-02-01 12:44:07', '2', '2010-02-01 12:44:07', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2011-03-29 21:37:06', '41', '2010-02-02 10:02:24', '2', '2010-02-02 10:02:24', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2011-03-29 21:37:06', '41', '2010-02-09 12:16:59', '2', '2010-02-09 12:16:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2011-05-03 23:38:10', '41', '2010-02-17 09:59:39', '2', '2010-02-17 09:59:39', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '44', '404', '1035', '2019-03-08 17:01:57', '41', '2010-06-03 06:53:03', '3', '2010-06-03 06:53:03', '9');
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
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'paadm', '1', '2021-11-30 11:25:31', '40', '2011-03-19 19:41:26', '2', '2011-03-19 19:41:26', '0');
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
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1020', '30', '4', 'publisher', '1', '2020-03-22 19:18:00', '41', '2015-03-11 09:31:38', '41', '2015-03-11 09:31:38', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1022', '22', '2', 'logs', '1', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1023', '31', '5', 'logs-view', '1', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1024', '31', '5', 'logs-edit', '1', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '40', '2015-06-18 22:06:16', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1041', '31', '5', 'page-edit-images', '1', '2019-03-08 17:03:19', '41', '2019-03-08 17:03:19', '41', '2019-03-08 17:03:19', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1032', '22', '2', 'db-backups', '1', '2015-06-23 15:52:38', '41', '2015-06-23 15:52:38', '41', '2015-06-23 15:52:38', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1033', '31', '5', 'db-backup', '1', '2015-06-23 15:52:38', '41', '2015-06-23 15:52:38', '41', '2015-06-23 15:52:38', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1039', '1012', '43', 'en', '1', '2016-10-24 17:07:04', '41', '2016-10-24 17:07:04', '41', '2016-10-24 17:07:04', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1042', '1', '47', 'resources', '1', '2021-11-30 11:45:27', '41', '2019-03-13 16:38:40', '41', '2019-03-13 16:38:57', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1044', '1', '46', 'api', '1029', '2021-12-13 16:57:23', '41', '2019-04-17 09:48:40', '41', '2019-04-17 09:48:40', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1045', '22', '2', 'procache', '1', '2019-04-17 09:50:52', '41', '2019-04-17 09:50:52', '41', '2019-04-17 09:50:52', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1049', '22', '2', 'appapi', '1', '2021-05-12 19:33:38', '41', '2021-05-12 19:33:38', '41', '2021-05-12 19:33:38', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1050', '31', '5', 'appapi_manage_applications', '1', '2021-05-12 19:33:38', '41', '2021-05-12 19:33:38', '41', '2021-05-12 19:33:38', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1051', '1042', '62', 'obstbaumschnitt-bei-kernobst', '1', '2021-11-30 17:08:25', '41', '2021-11-30 12:06:38', '41', '2021-11-30 12:21:49', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1052', '1', '49', 'authors', '1025', '2021-12-17 10:22:45', '41', '2021-11-30 12:15:04', '41', '2021-11-30 12:15:04', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1053', '1', '50', 'tags', '1025', '2021-12-16 20:36:41', '41', '2021-11-30 12:15:26', '41', '2021-11-30 12:15:26', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1055', '1052', '52', 'dominik-schreiber', '1', '2021-11-30 12:21:49', '41', '2021-11-30 12:21:49', '41', '2021-11-30 12:21:49', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1056', '1053', '53', 'obstbaumschnitt', '1', '2021-11-30 12:24:57', '41', '2021-11-30 12:24:57', '41', '2021-11-30 12:24:57', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1057', '1053', '53', 'gruenduengung', '1', '2021-11-30 12:25:10', '41', '2021-11-30 12:25:10', '41', '2021-11-30 12:25:10', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1058', '1052', '52', 'peter-meier', '1', '2021-11-30 12:29:51', '41', '2021-11-30 12:29:51', '41', '2021-11-30 12:29:51', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1120', '1042', '66', 'agroforstkampagne', '1', '2021-12-18 22:23:02', '41', '2021-12-18 22:21:01', '41', '2021-12-18 22:22:28', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1060', '2', '2', 'repeaters', '1036', '2021-11-30 12:39:07', '41', '2021-11-30 12:39:07', '41', '2021-11-30 12:39:07', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1105', '1042', '62', 'treating-the-farm-as-an-ecosystem', '1', '2021-12-16 09:45:05', '41', '2021-12-16 08:16:58', '41', '2021-12-16 08:19:42', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1106', '1053', '53', 'weideland', '1', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1107', '1053', '53', 'pasture', '1', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1108', '1053', '53', 'no-till', '1', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1067', '1060', '2', 'for-field-120', '17', '2021-11-30 13:09:08', '41', '2021-11-30 13:09:08', '41', '2021-11-30 13:09:08', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1097', '1053', '53', 'sektionierung', '1', '2021-11-30 15:26:59', '41', '2021-11-30 15:26:59', '41', '2021-11-30 15:26:59', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1109', '1053', '53', 'regenerative-agriculture', '1', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1110', '1052', '52', 'living-web-farms', '1', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1111', '1052', '52', 'gabe-brown', '1', '2021-12-16 08:29:50', '41', '2021-12-16 08:19:42', '41', '2021-12-16 08:19:42', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1104', '1', '45', 'about', '1', '2021-12-16 10:14:17', '41', '2021-12-09 22:30:29', '41', '2021-12-09 22:56:04', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1102', '1053', '53', 'mulch', '1', '2021-12-01 08:15:51', '41', '2021-12-01 08:15:51', '41', '2021-12-01 08:15:51', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1096', '1053', '53', 'zonierung', '1', '2021-11-30 15:26:59', '41', '2021-11-30 15:26:59', '41', '2021-11-30 15:26:59', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1095', '1053', '53', 'planung', '1', '2021-11-30 15:26:59', '41', '2021-11-30 15:26:59', '41', '2021-11-30 15:26:59', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1094', '1053', '53', 'permakultur', '1', '2021-11-30 15:26:59', '41', '2021-11-30 15:26:59', '41', '2021-11-30 15:26:59', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1119', '1052', '52', 'sustainable-agriculture-research-and-education-sare', '1', '2021-12-17 17:51:52', '41', '2021-12-17 17:51:52', '41', '2021-12-17 17:51:52', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1091', '1042', '63', 'permakultur-im-hausgarten', '1', '2021-12-14 16:40:14', '41', '2021-11-30 15:25:13', '41', '2021-11-30 15:26:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1099', '1042', '64', 'nesrin-caglak', '2049', '2021-12-01 08:53:56', '41', '2021-11-30 17:05:18', '41', '2021-11-30 17:05:48', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1100', '1042', '62', 'bodenverbesserung', '1', '2021-12-01 08:15:59', '41', '2021-12-01 08:11:53', '41', '2021-12-01 08:15:51', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1101', '1053', '53', 'bodenverbesserung', '1', '2021-12-01 08:15:51', '41', '2021-12-01 08:15:51', '41', '2021-12-01 08:15:51', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1086', '1052', '52', 'jonas-gampe', '1', '2021-12-21 19:06:58', '41', '2021-11-30 13:27:39', '41', '2021-11-30 13:27:39', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1112', '1042', '66', 'sus', '1', '2021-12-16 20:08:29', '41', '2021-12-16 19:24:16', '41', '2021-12-16 19:35:14', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1113', '1042', '63', 'lebensraum-trockenmauer', '1', '2021-12-17 09:20:06', '41', '2021-12-16 19:40:21', '41', '2021-12-16 19:43:44', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1114', '1053', '53', 'naturschutz', '1', '2021-12-16 19:43:44', '41', '2021-12-16 19:43:44', '41', '2021-12-16 19:43:44', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1115', '1053', '53', 'trockenmauer', '1', '2021-12-16 19:43:44', '41', '2021-12-16 19:43:44', '41', '2021-12-16 19:43:44', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1116', '1053', '53', 'handwerk', '1', '2021-12-16 19:43:44', '41', '2021-12-16 19:43:44', '41', '2021-12-16 19:43:44', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1117', '1052', '52', 'sofie-meys', '1', '2021-12-16 19:43:44', '41', '2021-12-16 19:43:44', '41', '2021-12-16 19:43:44', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1118', '1042', '63', 'managing-cover-crops-profitably', '1', '2021-12-17 17:53:38', '41', '2021-12-17 17:49:11', '41', '2021-12-17 17:51:52', '7');

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
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1050', '2', '2021-05-12 19:33:38');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1051', '1', '2021-11-30 12:06:38');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1052', '1', '2021-11-30 12:15:04');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1053', '1', '2021-11-30 12:15:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1118', '1', '2021-12-17 17:49:11');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1055', '1', '2021-11-30 12:21:49');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1056', '1', '2021-11-30 12:24:57');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1057', '1', '2021-11-30 12:25:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1058', '1', '2021-11-30 12:29:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1119', '1', '2021-12-17 17:51:52');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1091', '1', '2021-11-30 15:25:13');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1101', '1', '2021-12-01 08:15:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1100', '1', '2021-12-01 08:11:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1102', '1', '2021-12-01 08:15:51');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1120', '1', '2021-12-18 22:21:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1086', '1', '2021-11-30 13:27:39');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1094', '1', '2021-11-30 15:26:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1095', '1', '2021-11-30 15:26:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1096', '1', '2021-11-30 15:26:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1097', '1', '2021-11-30 15:26:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1099', '1', '2021-11-30 17:05:18');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1104', '1', '2021-12-09 22:30:29');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1105', '1', '2021-12-16 08:16:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1106', '1', '2021-12-16 08:19:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1107', '1', '2021-12-16 08:19:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1108', '1', '2021-12-16 08:19:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1109', '1', '2021-12-16 08:19:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1110', '1', '2021-12-16 08:19:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1111', '1', '2021-12-16 08:19:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1112', '1', '2021-12-16 19:24:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1113', '1', '2021-12-16 19:40:21');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1114', '1', '2021-12-16 19:43:44');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1115', '1', '2021-12-16 19:43:44');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1116', '1', '2021-12-16 19:43:44');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1117', '1', '2021-12-16 19:43:44');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1012', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1012', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1060', '2');

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

INSERT INTO `session_login_throttle` (`name`, `attempts`, `last_attempt`) VALUES('paadm', '1', '1640105741');

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
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1638269292,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1569416503,\"ns\":\"ProcessWire\",\"roles\":[37,1020]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('45', 'basic-page', '99', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1554985437,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('43', 'language', '97', '8', '0', '{\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Language\",\"pageLabelField\":\"name\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noChangeTemplate\":1,\"noUnpublish\":1,\"nameContentTab\":1,\"modified\":1426022568}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('44', 'http-status', '98', '0', '0', '{\"useRoles\":1,\"noChildren\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1638269292,\"ns\":\"ProcessWire\",\"roles\":[37,1020]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('46', 'api', '100', '0', '0', '{\"noChildren\":1,\"noParents\":-1,\"urlSegments\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1573458532,\"contentType\":\"json\",\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('47', 'resources', '101', '0', '0', '{\"noParents\":-1,\"childTemplates\":[62,63,64,65,66,67],\"slashUrls\":1,\"compile\":3,\"modified\":1638286095}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('48', 'resource', '102', '0', '0', '{\"parentTemplates\":[47],\"slashUrls\":1,\"compile\":3,\"modified\":1638274711}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('49', 'authors', '103', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1638270861}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('50', 'tags', '104', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1638270866}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('51', 'media_types', '105', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1638270882}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('52', 'author', '106', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1639639614}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('53', 'tag', '107', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1638271322}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('54', 'media_type', '108', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1638271337}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('68', 'search', '122', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1638369900}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('61', 'repeater_content', '115', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterMatrixPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1638284403}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('62', 'video', '116', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1639688451}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('63', 'publication', '117', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1639688200}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('64', 'person', '118', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1638288397}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('65', 'podcast', '119', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1639688394}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('66', 'institution', '120', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1639685722}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('67', 'tool', '121', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1638287525}');

# --- /WireDatabaseBackup {"numTables":41,"numCreateTables":41,"numInserts":821,"numSeconds":0}