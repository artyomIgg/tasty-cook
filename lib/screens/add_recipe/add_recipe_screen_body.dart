import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/routing/app_router.dart';
import 'package:tasty_cook/widgets/main_button.dart';

class AddRecipeScreenBody extends StatelessWidget {
  const AddRecipeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: constants.Colors.primaryGrey,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.add_recipe_about.tr(),
            textAlign: TextAlign.center,
            style: constants.Styles.textFieldWhite,
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: MainButton(
              onPressed: () => _onTapButton(context),
              text: 'Add new recipe',
            ),
          ),
        ],
      ),
    );
  }

  void _onTapButton(BuildContext context) {
    context.router.push(AddRecipeCreateRoute());
  }
}
