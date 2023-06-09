import 'package:logger/logger.dart';
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

  Future<void> logOut() async {
    await DatabaseService().cleanToken();
    await DatabaseService().cleanUser();
    AppState.token = '';
    AppState.logState = LoggedState.logout;
  }
}
