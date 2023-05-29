part of 'create_recipe_logic_cubit.dart';


@immutable
abstract class CreateRecipeLogicState {}

class CreateRecipeLogicInitial extends CreateRecipeLogicState {}

class UploadPhotoSuccess extends CreateRecipeLogicState {
  final XFile photo;

  UploadPhotoSuccess(this.photo);
}
