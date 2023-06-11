import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
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
  Future<RecipeModel?> createRecipe({required CreateRecipeModel recipe}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes',
      method: RequestMethods.post,
      data: recipe.toJson(),
    );

    if (response != null &&
        response is Response &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      return RecipeModel.fromJson(response.data);
    }

    return null;
  }

  @override
  Future<RecipeModel?> getRecipeById({required String id}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes/$id',
      method: RequestMethods.get,
    );

    if (response != null &&
        response is Response &&
        response.statusCode == 200) {
      return RecipeModel.fromJson(response.data);
    }

    return null;
  }

  @override
  Future<void> likeRecipe({required String id}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes/$id/likes',
      method: RequestMethods.patch,
    );

    if (response != null &&
        response is Response &&
        response.statusCode == 201) {}
  }

  @override
  Future<List<RecipeModel>?> getFavouriteRecipes() async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes/by-user/liked',
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
  Future<List<RecipeModel>?> getMyRecipes() async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes/by-user',
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
  Future<bool> updateMyRecipe({required RecipeModel recipe}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes',
      method: RequestMethods.patch,
      data: recipe.toJson(),
    );

    if (response != null &&
        response is Response &&
        response.statusCode == 201) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> addPhotoToRecipe(
      {required String id, required XFile photo}) async {
    await _httpService.init();

    final FormData formData = FormData.fromMap({
      'data': await MultipartFile.fromFile(photo.path, filename: photo.name),
    });

    final response = await _httpService.request(
      url: 'recipes/api/recipes/$id/image',
      method: RequestMethods.patch,
      data: formData,
    );

    if (response != null &&
        response is Response &&
        response.statusCode == 201) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> deleteRecipe({required String id}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes/$id',
      method: RequestMethods.delete,
    );

    if (response != null &&
        response is Response &&
        response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<List<RecipeModel>> searchRecipes({required String query}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'recipes/api/recipes',
      method: RequestMethods.get,
      data: {
        'searchValue': query,
      }
    );

    print('recipeSearch');

    if (response != null &&
        response is Response &&
        response.statusCode == 200) {
      return List<RecipeModel>.from(response.data['recipes'].map((e) {
        return RecipeModel.fromJson(e);
      }));
    }

    return [];
  }
}
