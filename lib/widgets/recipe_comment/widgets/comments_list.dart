import 'package:flutter/material.dart';
import 'package:tasty_cook/models/recipe/recipe_comment_model.dart';
import 'package:tasty_cook/widgets/recipe_comment/widgets/comment_card.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key, required this.comments});

  final List<RecipeCommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Column>.generate(
        comments.length,
        (index) => Column(
          children: [
            CommentCard(comment: comments[index],),
            const SizedBox(height: 16,),
          ],
        ),
      )
    );
  }
}
