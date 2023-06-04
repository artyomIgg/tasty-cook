import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/utils/app_state/app_state.dart';

part 'app_state_state.dart';

class AppStateCubit extends Cubit<AppStateState> {
  AppStateCubit() : super(AppStateInitial()) {
    initAppState();
  }

  AppState appState = AppState();

  Future<void> initAppState() async {
    await appState.initAppState();

    if (AppState.logState == LoggedState.logout) {
      emit(AppStateLogout());
    } else {
      emit(AppStateLogIn());
    }
  }

  Future<void> logOut() async {
    await appState.logOut();
    emit(AppStateLogout());
  }
}
