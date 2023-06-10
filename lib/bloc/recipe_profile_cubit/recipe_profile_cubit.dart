import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/repositories/recipe_repository/recipe_repository.dart';

part 'recipe_profile_state.dart';

class RecipeProfileCubit extends Cubit<RecipeProfileState> {
  RecipeProfileCubit() : super(RecipeProfileInitial()) {
    getFavouriteRecipe();
    getMyRecipe();
  }

  List<RecipeModel> recipesFavouriteList = [];
  List<RecipeModel> recipesMyList = [];

  Future<List<RecipeModel>> getFavouriteRecipe() async {
    emit(RecipeFavouriteLoading());

    final List<RecipeModel>? recipes =
        await RecipeRepository().getFavouriteRecipes();

    if (recipes != null) {
      recipesFavouriteList = recipes;
      emit(RecipeFavouriteLoaded(recipes));
      return recipes;
    } else {
      emit(RecipeFavouriteError('Recipes not found'));
      return [];
    }
  }

  Future<List<RecipeModel>> getMyRecipe() async {
    emit(RecipeMyLoading());

    final List<RecipeModel>? recipes = await RecipeRepository().getMyRecipes();

    if (recipes != null) {
      recipesMyList = recipes;
      emit(RecipeMyLoaded(recipes));
      return recipes;
    } else {
      emit(RecipeMyError('Recipes not found'));
      return [];
    }
  }
}
