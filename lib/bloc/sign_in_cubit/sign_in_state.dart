part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

// SIGN IN
class SignInSuccess extends SignInState {}

class SignInError extends SignInState {
  final String error;

  SignInError(this.error);
}

class SignInLoading extends SignInState {}

// SIGN UP
class SignUpSuccess extends SignInState {}

class SignUpCheckError extends SignInState {
  final String emailError;
  final String usernameError;
  final String passwordError;
  final String repeatedPasswordError;

  SignUpCheckError(
    this.emailError,
    this.usernameError,
    this.passwordError,
    this.repeatedPasswordError,
  );
}

class SignUpError extends SignInState {
  final String error;

  SignUpError(this.error);
}

class SignUpLoading extends SignInState {}

// EMAIL
class EmailValidatorError extends SignInState {
  final String error;

  EmailValidatorError(this.error);
}

class EmailValidatorSuccess extends SignInState {
  final String email;

  EmailValidatorSuccess(this.email);
}

// PASSWORD
class PasswordValidationError extends SignInState {
  final String error;

  PasswordValidationError(this.error);
}

class PasswordValidationSuccess extends SignInState {}

//REPEATED PASSWORD
class RepeatedPasswordSuccess extends SignInState {}

class RepeatedPasswordError extends SignInState {
  final String error;

  RepeatedPasswordError(this.error);
}
