import 'package:auto_route/auto_route.dart';
import 'package:tasty_cook/screens/main_screen/main_screen.dart';
import 'package:tasty_cook/screens/my_profile_screen/my_profile_screen.dart';
import 'package:tasty_cook/screens/reset_password_screen/reset_password_screen.dart';
import 'package:tasty_cook/screens/settings_screen/settings_screen.dart';
import 'package:tasty_cook/screens/sign_in_screen/sign_in_screen.dart';
import 'package:tasty_cook/screens/sign_up_screen/sign_up_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/sign-in',
          page: SignInRoute.page,
          initial: true,
        ),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: MyProfileRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}

