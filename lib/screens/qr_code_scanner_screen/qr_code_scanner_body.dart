import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/screens/qr_code_scanner_screen/widgets/qe_scanner_overlay.dart';
import 'package:tasty_cook/services/dynamic_links_service/dynamic_link_service.dart';
import 'package:tasty_cook/utils/app_state/app_state.dart';

class QrCodeScannerBody extends StatelessWidget {
  const QrCodeScannerBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double scannerSize = size.width * 0.8;
    QrScannerOverlayShape shape = QrScannerOverlayShape(
      cutOutHeight: scannerSize,
      cutOutWidth: scannerSize,
      overlayColor: Colors.black.withOpacity(.6),
      borderColor: constants.Colors.lightYellow,
    );

    return Container(
      alignment: Alignment.center,
      color: constants.Colors.primaryGrey,
      child: Stack(
        children: [
          MobileScanner(onDetect: (barcode) async {
            if (AppState.isBarcodeScanning) {
              AppState.isBarcodeScanning = false;
              final url = barcode.barcodes.first.url!.url!;

              await DynamicLinkService.dynamicLinkFromLink(context, url);
            }
          }),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: ShapeDecoration(
              shape: shape,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
