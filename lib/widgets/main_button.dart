import 'package:flutter/cupertino.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;


class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        onPressed!();
      },
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: constants.Colors.brightYellow,
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              constants.Colors.brightYellow,
              constants.Colors.lightYellow,
            ]
          )
        ),
        child: Text(text, style: constants.Styles.textFieldBlack,),
      ),
    );
  }
}
