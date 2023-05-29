import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:tasty_cook/routing/app_router.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: appRouter.config(),
            );
          },
        ),
      ),
    );
  }
}
