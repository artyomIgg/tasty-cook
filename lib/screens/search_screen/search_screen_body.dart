import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: constants.Colors.primaryGrey,
      child: const Text('search'),
    );
  }
}
