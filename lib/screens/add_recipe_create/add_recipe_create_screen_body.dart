import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_editor_enhanced/html_editor.dart' as editor;
// import 'package:quill_html_editor/quill_html_editor.dart' as quill;
import 'package:tasty_cook/bloc/recipe_logic_cubit/recipe_logic_cubit.dart';
import 'package:tasty_cook/bloc/recipe_cubit/recipe_cubit.dart';
import 'package:tasty_cook/bloc/recipe_profile_cubit/recipe_profile_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/widgets/main_button.dart';
import 'package:tasty_cook/widgets/my_loader.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';

class AddRecipeCreateBody extends StatefulWidget {
  const AddRecipeCreateBody(
      {super.key, this.recipe, this.isFromProfile = false});

  final RecipeModel? recipe;
  final bool isFromProfile;

  @override
  State<AddRecipeCreateBody> createState() => _AddRecipeCreateBodyState();
}

class _AddRecipeCreateBodyState extends State<AddRecipeCreateBody> {
  final editor.HtmlEditorController _editorController =
      editor.HtmlEditorController();

  late final TextEditingController _titleController =
      TextEditingController(text: widget.recipe?.title);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 300)).then((value) {
        setDescription();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // quill.QuillController.basic();
    // final document = quill.Document()..insert(0, recipe!.description);
    //
    // document.toDelta();
    // _quillController.document.insert(0, document);

    // final q = quill.QuillController(document: quill.Document.fromDelta(delta), selection: TextSelection.collapsed(offset: 0),)

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
      child: BlocBuilder<RecipeLogicCubit, RecipeLogicState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
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
          // quill.ToolBar(
          //   controller: _quillEditorController,
          //   // showDividers: false,
          //   // multiRowsDisplay: false,
          //   // showUnderLineButton: false,
          //   // showStrikeThrough: false,
          //   // showInlineCode: false,
          //   // showColorButton: false,
          //   // showBackgroundColorButton: false,
          //   // showClearFormat: false,
          //   // showLeftAlignment: false,
          //   // showCenterAlignment: false,
          //   // showRightAlignment: false,
          //   // showJustifyAlignment: false,
          //   // showListCheck: false,
          //   // showCodeBlock: false,
          //   // showQuote: false,
          //   // showIndent: false,
          //   // showLink: false,
          //   // showUndo: false,
          //   // showRedo: false,
          //   // showSearchButton: false,
          //   // showSubscript: false,
          //   // showSuperscript: false,
          // ),
          // Expanded(
          //   child:
          const SizedBox(
            height: 16,
          ),
          Container(
            height: size.height * 0.43,
            // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: editor.HtmlEditor(
              controller: _editorController, //required
              htmlToolbarOptions: const editor.HtmlToolbarOptions(
                defaultToolbarButtons: [
                  editor.StyleButtons(),
                  editor.ListButtons(
                    listStyles: false,
                  ),
                ],
                toolbarType: editor.ToolbarType.nativeGrid,
              ),
              htmlEditorOptions: const editor.HtmlEditorOptions(
                hint: "Your text here...",
                adjustHeightForKeyboard: false,
              ),
              otherOptions: editor.OtherOptions(
                height: size.height * 0.43,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
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
                    ? const Center(child: MyLoader())
                    : MainButton(
                        text: widget.isFromProfile ? 'Update' : 'Create',
                        onPressed: () => widget.isFromProfile
                            ? _updateRecipe(context)
                            : _createRecipe(context)),
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
    final RecipeLogicCubit createRecipeLogicCubit =
        BlocProvider.of<RecipeLogicCubit>(context);

    createRecipeLogicCubit.pickPhoto();
  }

  Future<void> _createRecipe(BuildContext context) async {
    final RecipeCubit recipeCubit = BlocProvider.of<RecipeCubit>(context);
    final RecipeProfileCubit recipeProfileCubit =
        BlocProvider.of<RecipeProfileCubit>(context);

    final String recipeHtml = await _editorController.getText();

    await recipeCubit
        .createRecipe(_titleController.text, recipeHtml, []).then((value) {
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

    unawaited(recipeCubit.getRecipes()); // todo remove
    unawaited(recipeProfileCubit.getMyRecipe());
  }

  Future<bool> _updateRecipe(BuildContext context) async {
    final RecipeCubit recipeCubit = BlocProvider.of<RecipeCubit>(context);
    final RecipeProfileCubit recipeProfileCubit =
        BlocProvider.of<RecipeProfileCubit>(context);

    final String recipeHtml = await _editorController.getText();

    widget.recipe!.description = recipeHtml;
    widget.recipe!.title = _titleController.text;

    final bool isRecipeUpdated = await recipeCubit.updateRecipe(widget.recipe!);

    // ignore: use_build_context_synchronously
    unawaited(context.router.pop());
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Your recipe was updated!',
          style: constants.Styles.textSmallGold,
        ),
      ),
    );

    unawaited(recipeCubit.getRecipes()); // todo remove
    unawaited(recipeProfileCubit.getMyRecipe());

    return isRecipeUpdated;
  }

  Future<void> setDescription() async {
    _editorController.setText(widget.recipe!.description);
  }
}
