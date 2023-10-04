part of 'app_state_cubit.dart';

@immutable
abstract class AppStateState {}

class AppStateInitial extends AppStateState {}

class AppStateLogout extends AppStateState {}

class AppStateLogIn extends AppStateState {}

class AppStateChangeSuccess extends AppStateState {}
