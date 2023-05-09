import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppInit {
  static Future<void> appInit() async {
    // Easy Localization
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}