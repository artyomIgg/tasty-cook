import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'
    as html_widget;
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

part 'recipe_logic_state.dart';

class RecipeLogicCubit extends Cubit<RecipeLogicState> {
  RecipeLogicCubit() : super(RecipeLogicInitial());

  Future<XFile?> pickPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);

    if (image != null) {
      emit(UploadPhotoSuccess(image));
    }

    return image;
  }

  Widget getHtmlWidget(
    String html, {
    String color = 'black',
    int? fontSize,
  }) {
    final Widget widget = html_widget.HtmlWidget(
      html,
      customStylesBuilder: (element) {
        return {
          'color': color,
          if (fontSize != null) ...{'font-size': '${fontSize}px'},
        };
      },
    );
    return widget;
  }
}
