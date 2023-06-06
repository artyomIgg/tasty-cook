import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/screens/add_recipe/add_recipe_screen.dart';
import 'package:tasty_cook/screens/add_recipe_create/add_recipe_create_screen.dart';
import 'package:tasty_cook/screens/main_screen/main_screen.dart';
import 'package:tasty_cook/screens/my_profile_screen/my_profile_screen.dart';
import 'package:tasty_cook/screens/recipe_screen/recipe_screen.dart';
import 'package:tasty_cook/screens/reset_password_screen/reset_password_screen.dart';
import 'package:tasty_cook/screens/search_screen/search_screen.dart';
import 'package:tasty_cook/screens/settings_screen/settings_screen.dart';
import 'package:tasty_cook/screens/sign_in_screen/sign_in_screen.dart';
import 'package:tasty_cook/screens/sign_up_screen/sign_up_screen.dart';
import 'package:tasty_cook/utils/app_state/app_state.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // LOGOUT ROUTES
        if (AppState.logState == LoggedState.logout) ...[
          AutoRoute(
            path: '/sign-in',
            page: SignInRoute.page,
            initial: true,
          ),
          AutoRoute(page: SignUpRoute.page),
          AutoRoute(page: ResetPasswordRoute.page),
          AutoRoute(page: MainRoute.page),
        ]
        // SIGNING ROUTES
        else if (AppState.logState == LoggedState.logIn) ...[
          AutoRoute(
            path: '/main',
            page: MainRoute.page,
            initial: true,
          ),
        ],
        // MAIN ROUTES
        AutoRoute(page: MyProfileRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: RecipeRoute.page),
        AutoRoute(page: AddRecipeRoute.page),
        AutoRoute(page: AddRecipeCreateRoute.page),
        AutoRoute(page: SearchRoute.page),
      ];
}
