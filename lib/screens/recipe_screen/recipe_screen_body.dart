import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/bloc/recipe_logic_cubit/recipe_logic_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/models/recipe/recipe_model.dart';
import 'package:tasty_cook/utils/qr_code/qr_cdoe_generator.dart';
import 'package:tasty_cook/widgets/main_button.dart';

class RecipeScreenBody extends StatelessWidget {
  RecipeScreenBody({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    final Widget description =
        RecipeLogicCubit().getHtmlWidget(recipe.description);

    return Container(
      width: 100.w,
      height: 100.h,
      // alignment: Alignment.topCenter,
      color: constants.Colors.primaryGrey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: SizedBox()),
                Flexible(
                  flex: 10,
                  child: Text(
                    recipe.title,
                    style: constants.Styles.mainScreenTitle,
                  ),
                ),
                Flexible(
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(
                      Icons.favorite_border,
                      color: constants.Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _myDivider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: MainButton(
                  text: 'Create Qr-Code',
                  onPressed: () => _showDialog(context)),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _myDivider()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.8),
              ),
              child: description,
            )
          ],
        ),
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

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: constants.Colors.primaryGrey,
              ),
              // child: Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Text('qwe'),
              //   ],
              // ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QrCodeGenerator.getQrCodeImage(),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: MainButton(
                      text: 'Share',
                      onPressed: () {
                        QrCodeGenerator.shareQr('test');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
