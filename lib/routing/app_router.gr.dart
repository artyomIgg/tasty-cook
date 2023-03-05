// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:tasty_cook/screens/firs_screen.dart' as _i2;
import 'package:tasty_cook/screens/second_screen.dart' as _i3;
import 'package:tasty_cook/screens/third_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ThirdScreen.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.ThirdScreen(),
      );
    },
    FirstScreen.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.FirstScreen(),
      );
    },
    SecondScreen.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SecondScreen(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          ThirdScreen.name,
          path: '/',
        ),
        _i4.RouteConfig(
          FirstScreen.name,
          path: '/first-screen',
        ),
        _i4.RouteConfig(
          SecondScreen.name,
          path: '/second-screen',
        ),
      ];
}

/// generated route for
/// [_i1.ThirdScreen]
class ThirdScreen extends _i4.PageRouteInfo<void> {
  const ThirdScreen()
      : super(
          ThirdScreen.name,
          path: '/',
        );

  static const String name = 'ThirdScreen';
}

/// generated route for
/// [_i2.FirstScreen]
class FirstScreen extends _i4.PageRouteInfo<void> {
  const FirstScreen()
      : super(
          FirstScreen.name,
          path: '/first-screen',
        );

  static const String name = 'FirstScreen';
}

/// generated route for
/// [_i3.SecondScreen]
class SecondScreen extends _i4.PageRouteInfo<void> {
  const SecondScreen()
      : super(
          SecondScreen.name,
          path: '/second-screen',
        );

  static const String name = 'SecondScreen';
}
