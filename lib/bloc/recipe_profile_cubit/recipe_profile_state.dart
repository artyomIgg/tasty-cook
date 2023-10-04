part of 'recipe_profile_cubit.dart';

@immutable
abstract class RecipeProfileState {}

class RecipeProfileInitial extends RecipeProfileState {}

// FAVOURITE RECIPES
class RecipeFavouriteLoading extends RecipeProfileState {}

class RecipeFavouriteLoaded extends RecipeProfileState {
  final List<RecipeModel> recipes;

  RecipeFavouriteLoaded(this.recipes);
}

class RecipeFavouriteError extends RecipeProfileState {
  final String message;

  RecipeFavouriteError(this.message);
}

// MY RECIPES

class RecipeMyLoading extends RecipeProfileState {}

class RecipeMyLoaded extends RecipeProfileState {
  final List<RecipeModel> recipes;

  RecipeMyLoaded(this.recipes);
}

class RecipeMyError extends RecipeProfileState {
  final String message;

  RecipeMyError(this.message);
}
