import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/routing/app_router.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => _onCardPress(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        height: 80,
        decoration: BoxDecoration(
          color: constants.Colors.darkGrey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage(constants.Assets.recipePreview),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Title $index',
                        style: constants.Styles.recipeCardTitle,
                      ),
                      Text(
                        '22.05.2023',
                        style: constants.Styles.recipeCardDescription,
                      ),
                    ],
                  ),
                  Flexible(
                    child: Text(
                      'Description Description Description Descri Description Description Description Description Description Description Description Description Description Description Description Description ',
                      style: constants.Styles.recipeCardDescription,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCardPress(BuildContext context) {
    context.router.push(
      RecipeRoute(
        title: 'Title $index',
      ),
    );
  }
}
