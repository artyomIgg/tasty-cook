import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class MyLoader extends StatelessWidget {
  const MyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: constants.Colors.primaryYellow,
    );
  }
}
