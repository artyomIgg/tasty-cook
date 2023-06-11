import 'package:image_picker/image_picker.dart';
import 'package:tasty_cook/models/recipe/create_recipe_model.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';

abstract class RecipeRepositoryBase {
  Future<List<RecipeModel>?> getRecipes();
  Future<List<RecipeModel>?> getFavouriteRecipes();
  Future<List<RecipeModel>?> getMyRecipes();
  Future<RecipeModel?> createRecipe({required CreateRecipeModel recipe});
  Future<RecipeModel?> getRecipeById({required String id});
  Future<void> likeRecipe({required String id});
  Future<bool> updateMyRecipe({required RecipeModel recipe});
  Future<bool> addPhotoToRecipe({required String id, required XFile photo});
  Future<bool> deleteRecipe({required String id});
  Future<List<RecipeModel>> searchRecipes({required String query});
}
