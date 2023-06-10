import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/recipe_profile_cubit/recipe_profile_cubit.dart';
import 'package:tasty_cook/widgets/recipe_card.dart';

class MyRecipes extends StatelessWidget {
  const MyRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeProfileCubit, RecipeProfileState>(
      builder: (context, state) {
        final RecipeProfileCubit cubit =
            BlocProvider.of<RecipeProfileCubit>(context);
        return ListView.builder(
          itemCount: cubit.recipesMyList.length,
          itemBuilder: (context, i) {
            return RecipeCard(
              index: i,
              recipe: cubit.recipesMyList[i],
              isFromProfile: true,
            );
          },
        );
      },
    );
  }
}
