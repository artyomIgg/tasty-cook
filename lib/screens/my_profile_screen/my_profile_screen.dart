import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/screens/my_profile_screen/my_profile_screen_body.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

@RoutePage()
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Profile', style: constants.Styles.mainScreenTitle),
          backgroundColor: constants.Colors.primaryYellow,
          shadowColor: Colors.transparent,
        ),
        body: const MyProfileScreenBody(),
      ),
    );
  }
}
