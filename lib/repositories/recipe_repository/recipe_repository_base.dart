import 'package:tasty_cook/models/recipe_model.dart';

abstract class RecipeRepositoryBase {
  Future<List<RecipeModel>?> getRecipes();

}