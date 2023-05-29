import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/firebase_options.dart';
import 'package:tasty_cook/init/app_init.dart';
import 'package:tasty_cook/screens/home.dart';

import 'routing/app_route_init.dart';
import 'services/localization_service/localization_service.dart';

void main() async {
  await AppInit.appInit();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    LocalizationService.localizationWidget(
      child: Home(
        appRouter: AppRouteInit.initAppRoute(),
      ),
    ),
  );
}
