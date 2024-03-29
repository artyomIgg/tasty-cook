import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/bloc/recipe_cubit/recipe_cubit.dart';
import 'package:tasty_cook/bloc/recipe_logic_cubit/recipe_logic_cubit.dart';
import 'package:tasty_cook/bloc/recipe_profile_cubit/recipe_profile_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/services/dynamic_links_service/dynamic_link_service.dart';
import 'package:tasty_cook/utils/qr_code/qr_code_generator.dart';
import 'package:tasty_cook/widgets/main_button.dart';
import 'package:tasty_cook/widgets/my_loader.dart';
import 'package:tasty_cook/widgets/recipe_comment/recipe_comment_main.dart';

// ignore: must_be_immutable
class RecipeScreenBody extends StatefulWidget {
  RecipeScreenBody({
    super.key,
    required this.recipe,
    this.isFromProfile = false,
  });

  RecipeModel recipe;
  final bool isFromProfile;

  @override
  State<RecipeScreenBody> createState() => _RecipeScreenBodyState();
}

class _RecipeScreenBodyState extends State<RecipeScreenBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget description =
        RecipeLogicCubit().getHtmlWidget(widget.recipe.description);

    return Container(
      width: 100.w,
      height: 100.h,
      // alignment: Alignment.topCenter,
      color: constants.Colors.primaryGrey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _photoContainer(context),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(child: SizedBox()),
                Flexible(
                  flex: 10,
                  child: Text(
                    widget.recipe.title,
                    style: constants.Styles.mainScreenTitle,
                  ),
                ),
                Flexible(
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => _onLikePress(context, widget.recipe),
                    child: Icon(
                      widget.recipe.isUserLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _myDivider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: MainButton(
                  text: LocaleKeys.share_recipe.tr(),
                  onPressed: () => _showDialog(context)),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _myDivider()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.8),
              ),
              child: description,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _myDivider()),
            Text(
              LocaleKeys.comment.tr(),
              style: constants.Styles.mainScreenTitle,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RecipeCommentMain(recipe: widget.recipe,),
            )
          ],
        ),
      ),
    );
  }

  Widget _photoContainer(BuildContext context) {
    final RecipeModel recipe = widget.recipe;
    final image = recipe.imageUrl != null && recipe.imageUrl!.isNotEmpty
        ? NetworkImage(recipe.imageUrl!)
        : const AssetImage(constants.Assets.recipePreview);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      height: 180,
      decoration: BoxDecoration(
          color: constants.Colors.white.withOpacity(.2),
          image: DecorationImage(
              image: image as ImageProvider<Object>, fit: BoxFit.cover)),
    );
  }

  Widget _myDivider() {
    const double dividerThickness = 2;
    final Color dividerColor = constants.Colors.white.withOpacity(0.7);

    return Divider(
      thickness: dividerThickness,
      color: dividerColor,
      height: 26,
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: constants.Colors.primaryGrey,
              ),
              // child: Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Text('qwe'),
              //   ],
              // ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FutureBuilder(
                    future: DynamicLinkService.createDynamicLinkRecipe(
                        widget.recipe.id.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return QrCodeGenerator.getQrCodeImage(
                            snapshot.data as String);
                      }
                      return const SizedBox(
                          height: 256,
                          width: double.infinity,
                          child: Center(child: MyLoader()));
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MainButton(
                      text: LocaleKeys.share_with_qr_code.tr(),
                      onPressed: () async {
                        final url =
                            await DynamicLinkService.createDynamicLinkRecipe(
                                widget.recipe.id.toString());
                        await QrCodeGenerator.shareQr(url);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MainButton(
                      text: LocaleKeys.share_with_link.tr(),
                      onPressed: () async {
                        final url =
                            await DynamicLinkService.createDynamicLinkRecipe(
                                widget.recipe.id.toString());
                        await DynamicLinkService.shareLink(url);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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

    setState(() {});
  }
}
