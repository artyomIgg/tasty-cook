import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/screens/recipe_screen/recipe_screen_body.dart';

@RoutePage()
class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    super.key,
    required this.recipe,
    this.isFromProfile = false,
  });

  final RecipeModel recipe;
  final bool isFromProfile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(LocaleKeys.about_recipe.tr(),
              style: constants.Styles.mainScreenTitle),
          backgroundColor: constants.Colors.primaryYellow,
          shadowColor: Colors.transparent,
        ),
        body: RecipeScreenBody(
          recipe: recipe,
          isFromProfile: isFromProfile,
        ),
      ),
    );
  }
}
