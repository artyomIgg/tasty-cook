import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/models/recipe/recipe_comment_model.dart';
import 'package:tasty_cook/repositories/recipe_repository/recipe_repository.dart';

part 'recipe_comment_state.dart';

class RecipeCommentCubit extends Cubit<RecipeCommentState> {
  RecipeCommentCubit({required String id}) : super(RecipeCommentInitial()) {
    getRecipeComments(id.toString());
  }

  List<RecipeCommentModel> recipes = [];

  Future<List<RecipeCommentModel>> getRecipeComments(String id) async {
    emit(RecipeCommentsLoading());

    final List<RecipeCommentModel> comments =
    await RecipeRepository().getComments(recipeId: id);

    if (comments.isNotEmpty) {
      emit(RecipeCommentsLoaded(comments));
      recipes = comments;
      return comments;
    } else {
      emit(RecipeCommentsError('Recipes not found'));
      return [];
    }
  }

  Future<bool> addComment(String id, String comment) async {
    emit(RecipeCommentCreating());

    final bool isCommentAdded = await RecipeRepository().createComment(
      recipeId: id,
      comment: comment,
    );

    if (isCommentAdded) {
      emit(RecipeCommentCreated());
    } else {
      emit(RecipeCommentCreateError('Recipes not found'));
    }

    return isCommentAdded;
  }
}
