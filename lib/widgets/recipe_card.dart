import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/bloc/recipe_logic_cubit/recipe_logic_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/routing/app_router.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.index,
    required this.recipe,
  });

  final int index;
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    final Widget description = RecipeLogicCubit()
        .getHtmlWidget(recipe.description, color: 'white', fontSize: 12);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => _onCardPress(context, recipe),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        height: 80,
        decoration: BoxDecoration(
          color: constants.Colors.darkGrey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage(constants.Assets.recipePreview),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        recipe.title,
                        style: constants.Styles.recipeCardTitle,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              child: const Icon(
                                Icons.favorite,
                                color: constants.Colors.lightRed,
                                size: 16,
                              )),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            '${recipe.likes}',
                            style: constants.Styles.recipeCardDescription,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: description,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCardPress(BuildContext context, RecipeModel recipe) {
    context.router.push(
      RecipeRoute(
        recipe: recipe,
      ),
    );
  }
}
