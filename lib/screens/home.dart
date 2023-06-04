import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/bloc/app_state_cubit/app_state_cubit.dart';
import 'package:tasty_cook/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:tasty_cook/bloc/user_cubit/user_cubit.dart';
import 'package:tasty_cook/routing/app_route_init.dart';
import 'package:tasty_cook/routing/app_router.dart';

class Home extends StatelessWidget {
  Home({super.key, required this.appRouter});

  AppRouter appRouter;

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
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return BlocBuilder<AppStateCubit, AppStateState>(
              builder: (context, state) {
                appRouter = AppRouteInit.initAppRoute();
                return MaterialApp.router(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  routerConfig: appRouter.config(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
