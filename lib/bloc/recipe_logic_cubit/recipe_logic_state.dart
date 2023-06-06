part of 'recipe_logic_cubit.dart';

@immutable
abstract class RecipeLogicState {}

class RecipeLogicInitial extends RecipeLogicState {}

class UploadPhotoSuccess extends RecipeLogicState {
  final XFile photo;

  UploadPhotoSuccess(this.photo);
}
