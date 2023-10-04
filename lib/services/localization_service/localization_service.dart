import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationService {
  static const List<Locale> _supportedLocales = [
    Locale('en', 'US'),
    Locale('uk', 'UA'),
  ];

  static const String _path = 'assets/localizations';

  static const Locale _fallbackLocale = Locale('en', 'US');

  static Widget localizationWidget({required Widget child}) {
    return EasyLocalization(
      supportedLocales: _supportedLocales,
      path: _path,
      fallbackLocale: _fallbackLocale,
      child: child,
    );
  }
}

class LocalizationStreamHelper {
  static StreamController<Locale> localizationStreamController =
      StreamController<Locale>.broadcast();

  static void updateStream(Locale locale) {
    LocalizationStreamHelper.localizationStreamController.add(locale);
  }
}
