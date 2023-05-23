import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/screens/add_recipe/add_recipe_screen_body.dart';

@RoutePage()
class AddRecipeScreen extends StatelessWidget {
  const AddRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Recipe', style: constants.Styles.mainScreenTitle),
          backgroundColor: constants.Colors.primaryYellow,
          shadowColor: Colors.transparent,
        ),
        body: const AddRecipeScreenBody(),
      ),
    );
  }
}
