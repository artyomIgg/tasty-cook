import 'package:dio/dio.dart';
import 'package:tasty_cook/models/recipe/create_recipe_model.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/repositories/recipe_repository/recipe_repository_base.dart';
import 'package:tasty_cook/services/http_service/http_service.dart';

class RecipeRepository extends RecipeRepositoryBase {
  final HttpService _httpService = HttpService();

  @override
  Future<List<RecipeModel>?> getRecipes() async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes',
      method: RequestMethods.get,
    );

    if (response != null &&
        response is Response &&
        response.statusCode == 200) {
      return List<RecipeModel>.from(response.data['recipes'].map((e) {
        return RecipeModel.fromJson(e);
      }));
    }

    return null;
  }

  @override
  Future<bool> createRecipe({required CreateRecipeModel recipe}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes',
      method: RequestMethods.post,
      params: recipe.toJson(),
    );

    if (response != null &&
        response is Response &&
        response.statusCode == 201) {
      return true;
    }

    return false;
  }
}
