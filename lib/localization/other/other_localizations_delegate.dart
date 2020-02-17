import 'dart:async';

import 'package:flutter/material.dart';

import 'other_localizations.dart';

class OtherLocalizationsDelegate extends LocalizationsDelegate<OtherLocalizations> {
  const OtherLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['pt', 'it', 'en'].contains(locale.languageCode);

  @override
  Future<OtherLocalizations> load(Locale locale) => OtherLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<OtherLocalizations> old) => false;
}