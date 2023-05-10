import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: constants.Colors.primaryGrey,
      child: const Text('Settings'),
    );
  }
}
