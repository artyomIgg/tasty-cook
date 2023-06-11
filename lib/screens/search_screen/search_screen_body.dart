import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/widgets/recipe_card.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key, required this.recipes});

  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.Colors.primaryGrey,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, i) {
          return RecipeCard(
            index: i,
            recipe: recipes[i],
          );
        },
      ),
    );
  }
}
