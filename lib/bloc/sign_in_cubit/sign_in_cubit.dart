import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/models/anonymous_user.dart';
import 'package:tasty_cook/models/user_model.dart';
import 'package:tasty_cook/repositories/auth_repository/auth_repositry.dart';
import 'package:tasty_cook/utils/text_validators/text_validator.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  void restartCubit() {
    emit(SignInInitial());
  }

  Future<bool> signIn(String email, String password) async {
    emit(SignInLoading());
    const String error = 'Wrong email or password';
    final bool result = email == 'test@gmail.com' && password == 'qwe123qwe';

    return result;

    final AnonymousUser anonymousUser = AnonymousUser(
      email: email,
      password: password,
    );

    final UserModel? user = await AuthRepository()
        .logInWithEmailAndPassword(anonymousUser: anonymousUser);

    if(user != null) {
      emit(SignInSuccess(user));
      return true;
    } else {
      emit(SignInError(error));
      return false;
    }
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

  Future googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      return null;
    }

    final UserModel? user =
        await AuthRepository().logInWithGoogle(token: googleSignInAccount.id);

    if (user != null) {
      emit(SignInSuccess(user));
    } else {
      emit(SignInError('Something went wrong'));
    }
  }
}
