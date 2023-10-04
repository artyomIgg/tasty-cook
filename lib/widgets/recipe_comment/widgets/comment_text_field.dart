import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/recipe_comment_cubit/recipe_comment_cubit.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/widgets/main_button.dart';
import 'package:tasty_cook/widgets/my_loader.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';

class CommentTextField extends StatelessWidget {
  CommentTextField({super.key, this.isLoading = false, required this.recipe});

  final bool isLoading;

  final _commentEditingController = TextEditingController();
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            width: size.width * 0.75,
            child: MyTextField(
              hintText: LocaleKeys.your_comment.tr(),
              controller: _commentEditingController,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: isLoading
              ? const Center(child: MyLoader())
              : MainButton(
                  text: 'q',
                  onPressed: () => createComment(context),
                  icon: const Icon(
                    Icons.send,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> createComment(BuildContext context) async {
    final String comment = _commentEditingController.text;
    if (comment.isEmpty) {
      return;
    }
    await context
        .read<RecipeCommentCubit>()
        .addComment(recipe.id.toString(), comment);
    // ignore: use_build_context_synchronously
    unawaited(context
        .read<RecipeCommentCubit>()
        .getRecipeComments(recipe.id.toString()));
    _commentEditingController.clear();
  }
}
