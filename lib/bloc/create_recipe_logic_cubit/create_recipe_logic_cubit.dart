import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

part 'create_recipe_logic_state.dart';

class CreateRecipeLogicCubit extends Cubit<CreateRecipeLogicState> {
  CreateRecipeLogicCubit() : super(CreateRecipeLogicInitial());

  Future<XFile?> pickPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null) {
      emit(UploadPhotoSuccess(image));
    }

    return image;
  }
}
