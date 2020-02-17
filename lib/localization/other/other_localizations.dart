import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './generated/l10n/messages_all.dart';

/// In order to generate new arb files we must run
/// `flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/localization/other/generated/l10n lib/localization/other/other_localizations.dart`
/// To add new files, add the arb files with the `_pt` or other iso code suffoix
/// Also, open the file and add this at the top:
///     "@@locale": "pt",
/// After editing and creating the necessary translations we need to run
/// `flutter pub pub run intl_translation:generate_from_arb lib/localization/other/other_localizations.dart lib/localization/other/generated/l10n/*.arb  --output-dir=lib/localization/other/generated/l10n`
class OtherLocalizations {
  /// Initialize localization systems and messages
  static Future<OtherLocalizations> load(Locale locale) async {
    // If we're given "en_US", we'll use it as-is. If we're
    // given "en", we extract it and use it.
    final String localeName =
        locale.countryCode == null || locale.countryCode.isEmpty
            ? locale.languageCode
            : locale.toString();

    // We make sure the locale name is in the right format e.g.
    // converting "en-US" to "en_US".
    final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);

    // Load localized messages for the current locale.
    await initializeMessages(canonicalLocaleName);
    // We'll uncomment the above line after we've built our messages file

    // Force the locale in Intl.
    Intl.defaultLocale = canonicalLocaleName;

    return OtherLocalizations();
  }

  /// Intro Page
  String get textIntroFirstPageTitle => Intl.message(
        "This is another text",
        name: 'textIntroFirstPageTitle',
        desc: '[Intro Screen] Intro Page 1 Title',
      );
  
  /// Retrieve localization resources for the widget tree
  /// corresponding to the given `context`
  static OtherLocalizations of(BuildContext context) =>
      Localizations.of<OtherLocalizations>(context, OtherLocalizations);
}
