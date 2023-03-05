import 'package:auto_route/annotations.dart';
import 'package:tasty_cook/screens/firs_screen.dart';
import 'package:tasty_cook/screens/second_screen.dart';
import 'package:tasty_cook/screens/third_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ThirdScreen, initial: true),
    AutoRoute(page: FirstScreen),
    AutoRoute(page: SecondScreen),
  ],
)
// extend the generated private router
class $AppRouter {}
