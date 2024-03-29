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

  static TextStyle title18 = GoogleFonts.poppins(
    fontSize: 18,
    color: c.Colors.white,
  );

  static TextStyle title22Black = GoogleFonts.poppins(
    fontSize: 22,
    color: c.Colors.black,
  );

  static TextStyle mainScreenTitle = GoogleFonts.poppins(
    fontSize: 26,
    color: c.Colors.white,
    fontWeight: FontWeight.w500,
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

  static TextStyle errorSmall = GoogleFonts.poppins(
    fontSize: 10,
    color: c.Colors.redHover,
    fontWeight: FontWeight.w500,
  );

  static TextStyle listTileMainScreen = GoogleFonts.poppins(
    fontSize: 14,
    color: c.Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle recipeCardTitle = GoogleFonts.poppins(
    fontSize: 16,
    color: c.Colors.white,
    fontWeight: FontWeight.w500,
  );
  static TextStyle recipeCardDescription = GoogleFonts.poppins(
    fontSize: 10,
    color: c.Colors.white,
    fontWeight: FontWeight.w500,
  );
}
