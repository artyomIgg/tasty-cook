import 'dart:math';
import 'package:tasty_cook/constants/constants.dart' as constants;

import 'package:flutter/material.dart';

class QrScannerOverlayShape extends ShapeBorder {
  QrScannerOverlayShape({
    this.borderColor = constants.Colors.lightYellow,
    this.borderWidth = 5.0,
    this.overlayColor = Colors.black,
    this.borderRadius = 24,
    this.borderLength = 70,
    double? cutOutSize,
    double? cutOutWidth,
    double? cutOutHeight,
    this.cutOutBottomOffset = 50,
  })  : cutOutWidth = cutOutWidth ?? cutOutSize ?? 300,
        cutOutHeight = cutOutHeight ?? cutOutSize ?? 300 {
    assert(
    borderLength <=
        min(this.cutOutWidth, this.cutOutHeight) / 2 + borderWidth * 2,
    "Border can't be larger than ${min(this.cutOutWidth, this.cutOutHeight) / 2 + borderWidth * 2}",
    );
    assert(
    (cutOutWidth == null && cutOutHeight == null) ||
        (cutOutSize == null && cutOutWidth != null && cutOutHeight != null),
    'Use only cutOutWidth and cutOutHeight or only cutOutSize');
  }

  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutWidth;
  final double cutOutHeight;
  final double cutOutBottomOffset;

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }

    return getLeftTopPath(rect)
      ..lineTo(
        rect.right,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.top,
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final borderWidthSize = width / 2;
    final height = rect.height;
    final borderOffset = borderWidth / 2;
    final borderLengthS =
    borderLength > min(cutOutHeight, cutOutHeight) / 2 + borderWidth * 2
        ? borderWidthSize / 2
        : borderLength;
    final cutOutWidthS =
    cutOutWidth < width ? cutOutWidth : width - borderOffset;
    final cutOutHeightS =
    cutOutHeight < height ? cutOutHeight : height - borderOffset;

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final boxPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final cutOutRect = Rect.fromLTWH(
      rect.left + width / 2 - cutOutWidthS / 2 + borderOffset,
      -cutOutBottomOffset +
          rect.top +
          height / 2 -
          cutOutHeightS / 2 +
          borderOffset,
      cutOutWidthS - borderOffset * 2,
      cutOutHeightS - borderOffset * 2,
    );
    final cutOutRect2 = Rect.fromLTWH(
      rect.left + width * 0.507 - cutOutWidthS / 2 + borderOffset,
      -cutOutBottomOffset +
          rect.top +
          height * 0.503 -
          cutOutHeightS / 2 +
          borderOffset,
      cutOutWidthS - borderOffset * 4,
      cutOutHeightS - borderOffset * 4,
    );

    canvas
      ..drawRect(
        rect,
        backgroundPaint,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(
          cutOutRect,
          Radius.circular(borderRadius),
        ),
        boxPaint,
      )
    // Draw top right corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - borderLengthS,
          cutOutRect.top,
          cutOutRect.right,
          cutOutRect.top + borderLengthS,
          topRight: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
    // Draw top left corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.top,
          cutOutRect.left + borderLengthS,
          cutOutRect.top + borderLengthS,
          topLeft: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
    // Draw bottom right corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - borderLengthS,
          cutOutRect.bottom - borderLengthS,
          cutOutRect.right,
          cutOutRect.bottom,
          bottomRight: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
    // Draw bottom left corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.bottom - borderLengthS,
          cutOutRect.left + borderLengthS,
          cutOutRect.bottom,
          bottomLeft: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(
          cutOutRect2,
          Radius.circular(borderRadius),
        ),
        boxPaint,
      )
      ..restore();
  }

  @override
  ShapeBorder scale(double t) {
    return QrScannerOverlayShape(
      borderColor: borderColor,
      borderWidth: borderWidth,
      overlayColor: overlayColor,
    );
  }
}
