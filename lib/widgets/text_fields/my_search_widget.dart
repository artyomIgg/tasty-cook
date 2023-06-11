import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class MySearchWidget extends StatelessWidget {
  const MySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      hintText: LocaleKeys.input_your_ingredients.tr(),
      color: Colors.transparent,
      icon: const Icon(Icons.search),
      iconColor: constants.Colors.primaryBlack,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
        borderSide: BorderSide(
          color: constants.Colors.primaryBlack,
          width: 2,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
        borderSide: BorderSide(
          color: constants.Colors.primaryGrey,
          width: 2,
        ),
      ),
    );
  }
}
