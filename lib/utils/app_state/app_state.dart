import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:tasty_cook/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:tasty_cook/services/database_service/database_service.dart';

enum LoggedState {
  logout,
  logIn,
}

class AppState {
  static LoggedState logState = LoggedState.logout;

  static String token = '';

  static bool isBarcodeScanning = true;

  Future<void> initAppState() async {
    final String? token = await DatabaseService().getToken();

    Logger().i(token);

    if (token != null) {
      AppState.token = token;
      AppState.logState = LoggedState.logIn;
    } else {
      AppState.token = '';
      AppState.logState = LoggedState.logout;
    }
  }

  Future<void> logOut(BuildContext context) async {
    await DatabaseService().cleanToken();
    await DatabaseService().cleanUser();
    await DatabaseService().cleanIsUserAuthWithGoogle();
    AppState.token = '';
    AppState.logState = LoggedState.logout;

    final SignInCubit cubit = BlocProvider.of<SignInCubit>(context);
    await cubit.signOutFromGoogle();
  }
}
