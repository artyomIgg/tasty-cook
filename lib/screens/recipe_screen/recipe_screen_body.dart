import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/bloc/recipe_logic_cubit/recipe_logic_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/models/recipe/recipe_model.dart';

class RecipeScreenBody extends StatelessWidget {
  RecipeScreenBody({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    final Widget description =
        RecipeLogicCubit().getHtmlWidget(recipe.description);

    return Container(
      width: 100.w,
      height: 100.h,
      // alignment: Alignment.topCenter,
      color: constants.Colors.primaryGrey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              recipe.title,
              style: constants.Styles.mainScreenTitle,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _myDivider()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.8),
              ),
              child: description,
            )
          ],
        ),
      ),
    );
  }

  Widget _myDivider() {
    const double dividerThickness = 2;
    final Color dividerColor = constants.Colors.white.withOpacity(0.7);

    return Divider(
      thickness: dividerThickness,
      color: dividerColor,
      height: 26,
    );
  }
}
