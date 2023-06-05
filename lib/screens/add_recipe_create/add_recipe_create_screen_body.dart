import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:tasty_cook/bloc/create_recipe_logic_cubit/create_recipe_logic_cubit.dart';
import 'package:tasty_cook/bloc/recipe_cubit/recipe_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/widgets/main_button.dart';
import 'package:tasty_cook/widgets/my_loader.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';

class AddRecipeCreateBody extends StatelessWidget {
  AddRecipeCreateBody({super.key});

  final quill.QuillController _quillController = quill.QuillController.basic();
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.topCenter,
      color: constants.Colors.primaryGrey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // _photoContainer(context),
            const SizedBox(
              height: 26,
            ),
            _mainInfo(context, size),
          ],
        ),
      ),
    );
  }

  Widget _photoContainer(BuildContext context) {
    return CupertinoButton(
      onPressed: () => _onTapButton(context),
      padding: EdgeInsets.zero,
      child: BlocBuilder<CreateRecipeLogicCubit, CreateRecipeLogicState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            height: 180,
            decoration: BoxDecoration(
              color: constants.Colors.white.withOpacity(.2),
              image: state is UploadPhotoSuccess
                  ? DecorationImage(
                      image: FileImage(File(state.photo.path)),
                      fit: BoxFit.cover)
                  : null,
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.photo_filter,
                  size: 64,
                  color: constants.Colors.white,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  state is UploadPhotoSuccess
                      ? 'Tap to change your dish photo'
                      : 'Tap to add your dish photo',
                  style: constants.Styles.recipeCardTitle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _mainInfo(BuildContext context, Size size) {
    const EdgeInsets elementsPadding = EdgeInsets.symmetric(horizontal: 6);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: elementsPadding,
            child: Row(
              children: [
                Text(
                  'Title of your recipe:',
                  style: constants.Styles.title18,
                ),
              ],
            ),
          ),
          _myDivider(),
          Padding(
            padding: elementsPadding,
            child: SizedBox(
              height: 36,
              child: MyTextField(
                controller: _titleController,
                hintText: 'Recipe title: Pasta Carbonara',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: elementsPadding,
            child: Row(
              children: [
                Text(
                  'Inner content:',
                  style: constants.Styles.title18,
                ),
              ],
            ),
          ),
          _myDivider(),
          quill.QuillToolbar.basic(
            controller: _quillController,
            showDividers: false,
            multiRowsDisplay: false,
            showUnderLineButton: false,
            showStrikeThrough: false,
            showInlineCode: false,
            showColorButton: false,
            showBackgroundColorButton: false,
            showClearFormat: false,
            showLeftAlignment: false,
            showCenterAlignment: false,
            showRightAlignment: false,
            showJustifyAlignment: false,
            showListCheck: false,
            showCodeBlock: false,
            showQuote: false,
            showIndent: false,
            showLink: false,
            showUndo: false,
            showRedo: false,
            showSearchButton: false,
            showSubscript: false,
            showSuperscript: false,
          ),
          // Expanded(
          //   child:
          const SizedBox(
            height: 16,
          ),
          Container(
            height: size.height * 0.43,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: quill.QuillEditor.basic(
              controller: _quillController,
              readOnly: false, // true for view only mode
            ),
            // ),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<RecipeCubit, RecipeState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: state is RecipeCreating
                    ? Center(child: const MyLoader())
                    : MainButton(
                        text: 'Create',
                        onPressed: () => _createRecipe(context)),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _myDivider() {
    const double dividerThickness = 2;
    final Color dividerColor = constants.Colors.white.withOpacity(0.7);

    return Divider(
      thickness: dividerThickness,
      color: dividerColor,
      height: 26,
    );
  }

  void _onTapButton(BuildContext context) {
    final CreateRecipeLogicCubit createRecipeLogicCubit =
        BlocProvider.of<CreateRecipeLogicCubit>(context);

    createRecipeLogicCubit.pickPhoto();
  }

  Future<void> _createRecipe(BuildContext context) async {
    final RecipeCubit recipeCubit = BlocProvider.of<RecipeCubit>(context);

    await recipeCubit.createRecipe(
        _titleController.text,
        _quillController.document.toDelta().toJson().toString(),
        []).then((value) {
      context.router.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'New recipe was created!',
            style: constants.Styles.textSmallGold,
          ),
        ),
      );
    });
  }
}
