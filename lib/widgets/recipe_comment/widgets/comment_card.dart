import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/models/recipe/recipe_comment_model.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final RecipeCommentModel comment;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${comment.username}:',
            style: constants.Styles.textFieldBlack.copyWith(
              color: _generateRandomNotLightColor(),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            comment.commentValue,
            style: constants.Styles.recipeCardDescription.copyWith(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // generate color generator with random non light colors
  Color _generateRandomNotLightColor() {
    final Random random = Random();
    final int red = random.nextInt(255);
    final int green = random.nextInt(255);
    final int blue = random.nextInt(255);
    final Color color = Color.fromRGBO(red, green, blue, 1);
    if (color.computeLuminance() > 0.5) {
      return _generateRandomNotLightColor();
    }
    return color;
  }
}
