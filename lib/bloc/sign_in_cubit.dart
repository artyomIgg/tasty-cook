import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/utils/text_validators/text_validator.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  void restartCubit() {
    emit(SignInInitial());
  }

  bool signIn(String email, String password) {
    const String error = 'Wrong email or password';
    final bool result = email == 'test@gmail.com' && password == 'qwe123qwe';
    result ? emit(SignInSuccess()) : emit(SignInError(error));

    return result;
  }

  bool signUp({
    required String email,
    required String username,
    required String password,
    required String repeatedPassword,
  }) {
    final bool isEmailValid = TextValidator.isEmailValid(email);
    final bool isUsernameValid = TextValidator.isUsernameValid(username);
    final bool isPasswordValid = TextValidator.isPasswordValid(password);
    final bool isRepeatedPasswordValid =
        isRepeatedPasswords(password, repeatedPassword);

    if (isEmailValid &&
        isUsernameValid &&
        isPasswordValid &&
        isRepeatedPasswordValid) {
      return true;
    } else {
      final String emailError = isEmailValid ? '' : 'Wrong email';
      final String usernameError = isUsernameValid ? '' : 'Wrong username';
      final String passwordError = isPasswordValid
          ? ''
          : 'Password must be at least 6 characters and one number';
      final String repeatedPasswordError =
          isRepeatedPasswordValid ? '' : 'Password does not match';

      emit(
        SignUpError(
          emailError,
          usernameError,
          passwordError,
          repeatedPasswordError,
        ),
      );
    }

    return false;
  }

  void validateEmail(String email) {
    final bool isEmail = TextValidator.isEmailValid(email);
    const String error = 'Wrong email';

    isEmail
        ? emit(EmailValidatorSuccess(email))
        : emit(EmailValidatorError(error));
  }

  void validatePassword(String password) {
    const String error =
        'Password must be at least 6 characters and one number';

    TextValidator.isPasswordValid(password)
        ? emit(PasswordValidationSuccess())
        : emit(PasswordValidationError(error));
  }

  bool isRepeatedPasswords(String password1, String password2) {
    const String error = 'Password does not match';
    final bool result = password1 == password2;
    result
        ? emit(RepeatedPasswordSuccess())
        : emit(RepeatedPasswordError(error));

    return result;
  }
}
