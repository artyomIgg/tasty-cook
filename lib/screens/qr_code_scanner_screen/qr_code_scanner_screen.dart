import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/screens/qr_code_scanner_screen/qr_code_scanner_body.dart';

@RoutePage()
class QrCodeScannerScreen extends StatelessWidget {
  const QrCodeScannerScreen({super.key});

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
        body: const QrCodeScannerBody(),
      ),
    );
  }
}
