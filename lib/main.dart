import 'package:flutter/material.dart';
import 'package:tasty_cook/routing/app_router.gr.dart';
import 'package:tasty_cook/screens/home.dart';

void main() {
  final AppRouter appRouter = AppRouter();

  runApp(
    Home(
      appRouter: appRouter,
    ),
  );
}
