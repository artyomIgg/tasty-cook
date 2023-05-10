import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_cook/constants/src/colors.dart' as c;

mixin Styles {
  // static const TextStyle subscriptionBestValue = TextStyle(
  //   fontSize: 11,
  //   fontFamily: Fonts.interBold,
  //   fontWeight: FontWeight.w700,
  //   color: colors.Colors.white,
  // );

  static TextStyle title = GoogleFonts.poppins(
    fontSize: 32,
    color: c.Colors.white,
  );

  static TextStyle textFieldBlack = GoogleFonts.poppins(
    fontSize: 15,
    color: c.Colors.black,
  );

  static TextStyle textFieldWhite = GoogleFonts.poppins(
    fontSize: 15,
    color: c.Colors.white,
  );

  static TextStyle textSmallWhite = GoogleFonts.poppins(
    fontSize: 12,
    color: c.Colors.white,
  );

  static TextStyle textSmallGold = GoogleFonts.poppins(
    fontSize: 12,
    color: c.Colors.brightYellow,
  );

  static TextStyle error = GoogleFonts.poppins(
    fontSize: 12,
    color: c.Colors.redHover,
    fontWeight: FontWeight.w500,
  );
}
