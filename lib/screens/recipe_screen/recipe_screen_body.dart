import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class RecipeScreenBody extends StatelessWidget {
  const RecipeScreenBody({super.key, required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: constants.Colors.primaryGrey,
      child: Text(title),
    );
  }
}
