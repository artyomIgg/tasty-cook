part of 'recipe_comment_cubit.dart';

@immutable
abstract class RecipeCommentState {}

class RecipeCommentInitial extends RecipeCommentState {}

// RECIPE COMMENTS

class RecipeCommentsLoading extends RecipeCommentState {}

class RecipeCommentsLoaded extends RecipeCommentState {
  final List<RecipeCommentModel> comments;

  RecipeCommentsLoaded(this.comments);
}

class RecipeCommentsError extends RecipeCommentState {
  final String message;

  RecipeCommentsError(this.message);
}

class RecipeCommentCreated extends RecipeCommentState {}

class RecipeCommentCreateError extends RecipeCommentState {
  final String message;

  RecipeCommentCreateError(this.message);
}

class RecipeCommentCreating extends RecipeCommentState {}
