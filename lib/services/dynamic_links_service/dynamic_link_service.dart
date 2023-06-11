import 'package:auto_route/auto_route.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tasty_cook/bloc/recipe_cubit/recipe_cubit.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/routing/app_router.dart';
import 'package:tasty_cook/utils/app_state/app_state.dart';

class DynamicLinkService {
  static Future<String> createDynamicLinkRecipe(String id) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://tastycook.page.link',
      link: Uri.parse('https://tasty-cook.vercel.app/recipe/$id'),
      androidParameters: const AndroidParameters(
        packageName: 'com.example.tasty_cook',
      ),
    );

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);

    return dynamicLink.shortUrl.toString();
  }

  static Future<void> dynamicLinkInitial(BuildContext context) async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      if (initialLink.link.toString().contains('recipe')) {
        final Uri uri = initialLink.link;
        final String recipeId = uri.pathSegments.last;
        final RecipeModel? recipe = await RecipeCubit().getRecipeById(recipeId);
        if (recipe != null) {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => RecipeScreen(recipe: recipe)));

          context.router.push(
            RecipeRoute(
              recipe: recipe,
            ),
          );
        }
      }
    }
  }

  static Future<void> dynamicLinkListen(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
      if (dynamicLinkData.link.toString().contains('recipe')) {
        final Uri uri = dynamicLinkData.link;
        final String recipeId = uri.pathSegments.last;
        final RecipeModel? recipe = await RecipeCubit().getRecipeById(recipeId);
        if (recipe != null) {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => RecipeScreen(recipe: recipe)));

          context.router.push(
            RecipeRoute(
              recipe: recipe,
            ),
          );
        }
      }
    }).onError((error) {
      Logger().e(error.toString());
    });
  }

  static Future<void> dynamicLinkFromLink(
      BuildContext context, String url) async {
    final link =
        await FirebaseDynamicLinks.instance.getDynamicLink(Uri.parse(url));

    if (link != null && link.link.toString().contains('recipe')) {
      final Uri uri = link.link;
      final String recipeId = uri.pathSegments.last;
      final RecipeModel? recipe = await RecipeCubit().getRecipeById(recipeId);
      if (recipe != null) {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => RecipeScreen(recipe: recipe)));

        context.router
            .push(
          RecipeRoute(
            recipe: recipe,
          ),
        )
            .then((value) {
          AppState.isBarcodeScanning = true;
        });
      }
    }
  }

  static Future<void> shareLink(String url) async {
    await Share.share(url);
  }
}
