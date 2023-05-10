import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/utils/text_validators/text_validator.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  void signIn(String email, String password) {
    const String error = 'Wrong email or password';
    email == 'test@gmail.com' && password == 'qwe123qwe'
        ? emit(SignInSuccess())
        : emit(SignInError(error));
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

  void isRepeatedPasswords(String password1, String password2) {
    const String error = 'Password does not match';
    password1 == password2
        ? emit(RepeatedPasswordSuccess())
        : emit(RepeatedPasswordError(error));
  }
}
