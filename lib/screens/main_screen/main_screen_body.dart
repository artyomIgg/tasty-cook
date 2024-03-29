import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/recipe_cubit/recipe_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/widgets/my_loader.dart';
import 'package:tasty_cook/widgets/recipe_card.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        final RecipeCubit cubit = BlocProvider.of<RecipeCubit>(context);
        return Container(
          color: constants.Colors.primaryGrey,
          alignment: Alignment.center,
          child: cubit.recipesList.isNotEmpty
              ? ListView.builder(
                  itemCount: cubit.recipesList.length,
                  itemBuilder: (context, i) {
                    return RecipeCard(
                      index: i,
                      recipe: cubit.recipesList[i],
                    );
                  },
                )
              : const MyLoader(),
        );
      },
    );
  }
}
