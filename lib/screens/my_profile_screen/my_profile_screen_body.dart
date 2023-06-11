import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class MyProfileScreenBody extends StatelessWidget {
  const MyProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: constants.Colors.primaryGrey,
        ),
      ),
    );
  }
}
