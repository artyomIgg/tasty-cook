part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;

  UserLoaded(this.user);
}

class UserLoading extends UserState {}

class UserSaved extends UserState {
  final UserModel user;

  UserSaved(this.user);
}

class UserError extends UserState {
  final String error;

  UserError(this.error);
}
