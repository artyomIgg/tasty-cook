part of 'recipe_cubit.dart';

@immutable
abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<RecipeModel> recipes;

  RecipeLoaded(this.recipes);
}

class RecipeError extends RecipeState {
  final String message;

  RecipeError(this.message);
}

// CREATE RECIPE
class RecipeCreating extends RecipeState {}

class RecipeCreated extends RecipeState {}

class RecipeCreateError extends RecipeState {
  final String message;

  RecipeCreateError(this.message);
}

// LIKE RECIPE
class RecipeLiked extends RecipeState {}
