import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.onChanged,});

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      hintText: LocaleKeys.email.tr(),
      style: constants.Styles.textFieldBlack,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
    );
  }
}
