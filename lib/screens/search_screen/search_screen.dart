import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/screens/search_screen/search_screen_body.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings', style: constants.Styles.mainScreenTitle),
          backgroundColor: constants.Colors.primaryYellow,
          shadowColor: Colors.transparent,
        ),
        body: const SearchScreenBody(),
      ),
    );
  }
}
