/** Mozilla User Preferences
 *
 * %APPDATA%\Mozilla\Firefox\Profiles\profile\user.js - anually created user.js file
 *
 * source: [arkenfox]{@link https://github.com/arkenfox/user.js}
 */

/* 0000: disable about:config warning ***/
user_pref("browser.aboutConfig.showWarning", false);

/*1200: HTTPS (SSL/TLS / OCSP / CERTS / HPKP) ***/
user_pref("dom.security.https_only_mode", true);

// browser.region.network.url
user_pref("browser.search.region", "US");
user_pref("browser.region.network.url", "");
user_pref("browser.region.update.enabled", false);
// more language defaults
user_pref("intl.accept_languages", "en-US, en, fr");
user_pref("javascript.use_us_english_locale", true);
