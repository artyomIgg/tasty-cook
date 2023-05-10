import 'package:email_validator/email_validator.dart';

class TextValidator {
  static bool isEmailValid(String email) {
    return EmailValidator.validate(email);
  }

  static bool isPasswordValid(String password) {
    final RegExp hasDigit = RegExp(r'\d');
    final RegExp hasMinLength = RegExp(r'^.{6,}$');

    return hasDigit.hasMatch(password) && hasMinLength.hasMatch(password);
  }
}
