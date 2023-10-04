import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/recipe_cubit/recipe_cubit.dart';
import 'package:tasty_cook/bloc/recipe_logic_cubit/recipe_logic_cubit.dart';
import 'package:tasty_cook/bloc/recipe_profile_cubit/recipe_profile_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/routing/app_router.dart';
import 'package:tasty_cook/widgets/delete_recipe_dialog.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.index,
    required this.recipe,
    this.isFromProfile = false,
  });

  final int index;
  final RecipeModel recipe;
  final bool isFromProfile;

  @override
  Widget build(BuildContext context) {
    final Widget description = RecipeLogicCubit()
        .getHtmlWidget(recipe.description, color: 'white', fontSize: 12);

    final image = recipe.imageUrl != null && recipe.imageUrl!.isNotEmpty
        ? NetworkImage(recipe.imageUrl!)
        : const AssetImage(constants.Assets.recipePreview);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => _onCardPress(context, recipe),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        height: 120,
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
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.white,
                image: DecorationImage(
                  image: image as ImageProvider,
                  fit: BoxFit.cover,
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
                      Expanded(
                        child: Text(
                          recipe.title,
                          style: constants.Styles.recipeCardTitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${recipe.likes}',
                            style: constants.Styles.recipeCardDescription,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          _sideButton(context, recipe),
                        ],
                      ),
                    ],
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: description,
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

  Widget _sideButton(BuildContext context, RecipeModel recipe) {
    return isFromProfile
        ? _removeButton(context, recipe)
        : _likeButton(context, recipe);
  }

  Widget _likeButton(BuildContext context, RecipeModel recipe) {
    return GestureDetector(
      onTap: () => _onLikePress(context, recipe),
      child: Icon(
        recipe.isUserLiked ? Icons.favorite : Icons.favorite_border,
        color: constants.Colors.lightRed,
        size: 26,
      ),
    );
  }

  Widget _removeButton(BuildContext context, RecipeModel recipe) {
    return GestureDetector(
      onTap: () => _showRemoveDialog(context),
      child: const Icon(
        Icons.highlight_remove,
        color: constants.Colors.lightRed,
        size: 26,
      ),
    );
  }

  Future<void> _showRemoveDialog(BuildContext context) async {
    await showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      context: context,
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        // dialogContext = context;
        return const DeleteRecipeDialog();
      },
    ).then((value) async {
      if (value is bool && value) {
        final RecipeCubit cubit = BlocProvider.of<RecipeCubit>(context);
        final bool isDeleted = await cubit.deleteRecipe(recipe.id.toString());

        if (isDeleted) {
          final RecipeProfileCubit recipeProfileCubit =
              BlocProvider.of<RecipeProfileCubit>(context);
          final RecipeCubit recipeCubit = BlocProvider.of<RecipeCubit>(context);
          unawaited(recipeCubit.getRecipes());
          unawaited(recipeProfileCubit.getMyRecipe());
          unawaited(recipeProfileCubit.getFavouriteRecipe());

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                LocaleKeys.recipe_deleted_successfully.tr(),
                style: constants.Styles.textSmallGold,
              ),
            ),
          );
        }
      }
    });
  }

  void _onCardPress(BuildContext context, RecipeModel recipe) {
    isFromProfile
        ? context.router.push(
            AddRecipeCreateRoute(recipe: recipe, isFromProfile: true),
          )
        : context.router.push(
            RecipeRoute(
              recipe: recipe,
              isFromProfile: isFromProfile,
            ),
          );
  }

  Future<void> _onLikePress(BuildContext context, RecipeModel recipe) async {
    final RecipeCubit cubit = BlocProvider.of<RecipeCubit>(context);
    final RecipeProfileCubit recipeProfileCubit =
        BlocProvider.of<RecipeProfileCubit>(context);

    await cubit.likeRecipe(recipe.id.toString());
    unawaited(recipeProfileCubit.getFavouriteRecipe());

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          recipe.isUserLiked
              ? LocaleKeys.you_have_liked_this_recipe.tr()
              : LocaleKeys.you_are_disliked_this_recipe.tr(),
          style: constants.Styles.textSmallGold,
        ),
        duration: const Duration(milliseconds: 700),
      ),
    );
  }
}
