import 'package:tasty_cook/models/recipe/create_recipe_model.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';

abstract class RecipeRepositoryBase {
  Future<List<RecipeModel>?> getRecipes();
  Future<List<RecipeModel>?> getFavouriteRecipes();
  Future<List<RecipeModel>?> getMyRecipes();
  Future<bool> createRecipe({required CreateRecipeModel recipe});
  Future<RecipeModel?> getRecipeById({required String id});
  Future<void> likeRecipe({required String id});
}
