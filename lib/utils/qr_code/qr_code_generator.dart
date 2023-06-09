import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

import 'package:tasty_cook/constants/constants.dart' as constants;

class QrCodeGenerator {
  static Future<File> createFileQrCode(String data) async {
    final image = await QrPainter(
      version: QrVersions.auto,
      data: data,
      color: constants.Colors.primaryGrey,
      emptyColor: constants.Colors.primaryYellow,
    ).toImage(2000);
    final ByteData? byteData =
        await image.toByteData(format: ImageByteFormat.png);
    final Uint8List? pngBytes = byteData?.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/qr_image.png').create();
    return await file.writeAsBytes(pngBytes!);
  }

  static Widget getQrCodeImage(String url) {
    return QrImageView(
      data: url,
      size: 256,
      gapless: false,
      foregroundColor: constants.Colors.primaryGrey,
      backgroundColor: constants.Colors.primaryYellow,
    );
  }

  static Future<void> shareQr(String data) async {
    final String qrText = data;
    final file = await QrCodeGenerator.createFileQrCode(qrText);
    await Share.shareFiles([file.path.toString()]);
  }
}
