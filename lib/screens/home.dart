import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/bloc/app_state_cubit/app_state_cubit.dart';
import 'package:tasty_cook/bloc/recipe_cubit/recipe_cubit.dart';
import 'package:tasty_cook/bloc/recipe_profile_cubit/recipe_profile_cubit.dart';
import 'package:tasty_cook/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:tasty_cook/bloc/user_cubit/user_cubit.dart';
import 'package:tasty_cook/routing/app_route_init.dart';
import 'package:tasty_cook/routing/app_router.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key, required this.appRouter});

  AppRouter appRouter;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        ),
        BlocProvider<AppStateCubit>(
          create: (context) => AppStateCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),
        BlocProvider<RecipeCubit>(
          create: (context) => RecipeCubit(),
        ),
        BlocProvider<RecipeProfileCubit>(
          create: (context) => RecipeProfileCubit(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return BlocBuilder<AppStateCubit, AppStateState>(
              buildWhen: (previous, current) {
                if (current is AppStateChangeSuccess) {
                  widget.appRouter = AppRouteInit.initAppRoute();
                }
                return current is! AppStateChangeSuccess;
              },
              builder: (context, state) {
                return MaterialApp.router(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  routerConfig: widget.appRouter.config(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
