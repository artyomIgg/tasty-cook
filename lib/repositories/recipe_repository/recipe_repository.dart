import 'package:tasty_cook/models/recipe_model.dart';
import 'package:tasty_cook/repositories/recipe_repository/recipe_repository_base.dart';
import 'package:tasty_cook/services/http_service/http_service.dart';

class RecipeRepository extends RecipeRepositoryBase {
  final HttpService _httpService = HttpService();

  @override
  Future<List<RecipeModel>?> getRecipes() async {
    await  _httpService.init();
    final response = await _httpService.request(
      url: 'recipes',
      method: RequestMethods.get,
    );

    if(response != null) {
      return response.map((e) => RecipeModel.fromJson(e)).toList();
    }

    return null;
  }
}