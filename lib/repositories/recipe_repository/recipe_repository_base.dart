import 'package:tasty_cook/models/recipe/create_recipe_model.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';

abstract class RecipeRepositoryBase {
  Future<List<RecipeModel>?> getRecipes();
  Future<bool> createRecipe({required CreateRecipeModel recipe});
  Future<RecipeModel?> getRecipeById({required String id});
}
