import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/models/recipe/create_recipe_model.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/repositories/recipe_repository/recipe_repository.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeInitial()) {
    getRecipes();
  }

  List<RecipeModel> recipesList = [];

  Future<List<RecipeModel>> getRecipes() async {
    emit(RecipeLoading());

    final List<RecipeModel>? recipes = await RecipeRepository().getRecipes();

    if (recipes != null) {
      recipesList = recipes;
      emit(RecipeLoaded(recipes));
      return recipes;
    } else {
      emit(RecipeError('Recipes not found'));
      return [];
    }
  }

  Future<void> createRecipe(
    String title,
    String description,
    List<String> categories,
  ) async {
    emit(RecipeCreating());

    final bool isCreated = await RecipeRepository().createRecipe(
        recipe: CreateRecipeModel(
            title: title, description: description, categories: categories));

    if (isCreated) {
      emit(RecipeCreated());
    } else {
      emit(RecipeCreateError('Recipes not found'));
    }
  }

  Future<RecipeModel?> getRecipeById(String id) async {
    final RecipeModel? recipe = await RecipeRepository().getRecipeById(id: id);

    return recipe;
  }

  Future<void> likeRecipe(String id) async {
    await RecipeRepository().likeRecipe(id: id);
    final index =
        recipesList.indexWhere((element) => element.id == int.parse(id));

    recipesList[index].isUserLiked = !recipesList[index].isUserLiked;

    if (recipesList[index].isUserLiked) {
      recipesList[index].likes++;
    } else {
      recipesList[index].likes--;
    }

    emit(RecipeLiked());
  }

  Future<bool> updateRecipe(RecipeModel recipe) async {
    emit(RecipeCreating());
    final bool isUpdated =
        await RecipeRepository().updateMyRecipe(recipe: recipe);

    if (isUpdated) {
      emit(RecipeCreated());
    } else {
      emit(RecipeCreateError('Recipes not found'));
    }

    return isUpdated;
  }
}
