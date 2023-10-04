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

// DELETE RECIPE
class RecipeDeleted extends RecipeState {}

class RecipeDeleteError extends RecipeState {
  final String message;

  RecipeDeleteError(this.message);
}

class RecipeDeleteLoading extends RecipeState {}

// SEARCH RECIPE
class RecipeSearchLoading extends RecipeState {}

class RecipeSearchLoaded extends RecipeState {
  final List<RecipeModel> recipes;

  RecipeSearchLoaded(this.recipes);
}

class RecipeSearchError extends RecipeState {
  final String message;

  RecipeSearchError(this.message);
}
