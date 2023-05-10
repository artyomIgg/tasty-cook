import 'package:flutter/cupertino.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.isRepeatPassword = false,
    required this.controller,
  });

  final bool isRepeatPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: controller,
      hintText: isRepeatPassword ? 'Repeat password' : 'Password',
      style: constants.Styles.textFieldBlack,
      keyboardType: TextInputType.text,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
