import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/widgets/recipe_card.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.Colors.primaryGrey,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) {
          return RecipeCard(
            index: i,
          );
        },
      ),
    );
  }
}
