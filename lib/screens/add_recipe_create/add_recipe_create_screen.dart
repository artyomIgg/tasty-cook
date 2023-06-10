// ignore_for_file: must_be_immutable

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/recipe_logic_cubit/recipe_logic_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/screens/add_recipe_create/add_recipe_create_screen_body.dart';

@RoutePage()
class AddRecipeCreateScreen extends StatelessWidget {
  AddRecipeCreateScreen({super.key, this.recipe, this.isFromProfile = false});

  final RecipeModel? recipe;
  bool isFromProfile;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeLogicCubit>(
          create: (context) => RecipeLogicCubit(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              isFromProfile ? 'Update your Recipe' : 'Create new recipe',
              style: constants.Styles.mainScreenTitle),
          backgroundColor: constants.Colors.primaryYellow,
          shadowColor: Colors.transparent,
        ),
        body: AddRecipeCreateBody(
          recipe: recipe,
          isFromProfile: isFromProfile,
        ),
      ),
    );
  }
}
