import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/recipe_comment_cubit/recipe_comment_cubit.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/widgets/my_loader.dart';
import 'package:tasty_cook/widgets/recipe_comment/widgets/comment_text_field.dart';
import 'package:tasty_cook/widgets/recipe_comment/widgets/comments_list.dart';

class RecipeCommentMain extends StatelessWidget {
  const RecipeCommentMain({super.key, this.isLoading = false, required this.recipe});

  final bool isLoading;
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeCommentCubit(id: recipe.id.toString()),
      child: BlocBuilder<RecipeCommentCubit, RecipeCommentState>(
        builder: (context, state) {
          final RecipeCommentCubit signInCubit =
              BlocProvider.of<RecipeCommentCubit>(context);
          return Column(
            children: [
              CommentTextField(
                isLoading: state is RecipeCommentCreating,
                recipe: recipe,
              ),
              const SizedBox(
                height: 10,
              ),
              if (state is RecipeCommentsLoading) const MyLoader(),
              CommentsList(
                comments: signInCubit.recipes,
              )
            ],
          );
        },
      ),
    );
  }
}
