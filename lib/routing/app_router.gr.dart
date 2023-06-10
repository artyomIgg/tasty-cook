// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    RecipeRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecipeScreen(
          key: args.key,
          recipe: args.recipe,
          isFromProfile: args.isFromProfile,
        ),
      );
    },
    AddRecipeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddRecipeScreen(),
      );
    },
    QrCodeScannerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QrCodeScannerScreen(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyProfileScreen(),
      );
    },
    AddRecipeCreateRoute.name: (routeData) {
      final args = routeData.argsAs<AddRecipeCreateRouteArgs>(
          orElse: () => const AddRecipeCreateRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddRecipeCreateScreen(
          key: args.key,
          recipe: args.recipe,
          isFromProfile: args.isFromProfile,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainScreen(key: args.key),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordScreen(),
      );
    },
  };
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecipeScreen]
class RecipeRoute extends PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute({
    Key? key,
    required RecipeModel recipe,
    bool isFromProfile = false,
    List<PageRouteInfo>? children,
  }) : super(
          RecipeRoute.name,
          args: RecipeRouteArgs(
            key: key,
            recipe: recipe,
            isFromProfile: isFromProfile,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipeRoute';

  static const PageInfo<RecipeRouteArgs> page = PageInfo<RecipeRouteArgs>(name);
}

class RecipeRouteArgs {
  const RecipeRouteArgs({
    this.key,
    required this.recipe,
    this.isFromProfile = false,
  });

  final Key? key;

  final RecipeModel recipe;

  final bool isFromProfile;

  @override
  String toString() {
    return 'RecipeRouteArgs{key: $key, recipe: $recipe, isFromProfile: $isFromProfile}';
  }
}

/// generated route for
/// [AddRecipeScreen]
class AddRecipeRoute extends PageRouteInfo<void> {
  const AddRecipeRoute({List<PageRouteInfo>? children})
      : super(
          AddRecipeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddRecipeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QrCodeScannerScreen]
class QrCodeScannerRoute extends PageRouteInfo<void> {
  const QrCodeScannerRoute({List<PageRouteInfo>? children})
      : super(
          QrCodeScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrCodeScannerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyProfileScreen]
class MyProfileRoute extends PageRouteInfo<void> {
  const MyProfileRoute({List<PageRouteInfo>? children})
      : super(
          MyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddRecipeCreateScreen]
class AddRecipeCreateRoute extends PageRouteInfo<AddRecipeCreateRouteArgs> {
  AddRecipeCreateRoute({
    Key? key,
    RecipeModel? recipe,
    bool isFromProfile = false,
    List<PageRouteInfo>? children,
  }) : super(
          AddRecipeCreateRoute.name,
          args: AddRecipeCreateRouteArgs(
            key: key,
            recipe: recipe,
            isFromProfile: isFromProfile,
          ),
          initialChildren: children,
        );

  static const String name = 'AddRecipeCreateRoute';

  static const PageInfo<AddRecipeCreateRouteArgs> page =
      PageInfo<AddRecipeCreateRouteArgs>(name);
}

class AddRecipeCreateRouteArgs {
  const AddRecipeCreateRouteArgs({
    this.key,
    this.recipe,
    this.isFromProfile = false,
  });

  final Key? key;

  final RecipeModel? recipe;

  final bool isFromProfile;

  @override
  String toString() {
    return 'AddRecipeCreateRouteArgs{key: $key, recipe: $recipe, isFromProfile: $isFromProfile}';
  }
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<MainRouteArgs> page = PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
