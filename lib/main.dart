import 'package:flutter/material.dart';
import 'package:tasty_cook/init/app_init.dart';
import 'package:tasty_cook/screens/home.dart';

import 'routing/app_route_init.dart';
import 'services/localization_service/localization_service.dart';

void main() async {
  await AppInit.appInit();

  runApp(
    LocalizationService.localizationWidget(
      child: Home(
        appRouter: AppRouteInit.initAppRoute(),
      ),
    ),
  );
}
