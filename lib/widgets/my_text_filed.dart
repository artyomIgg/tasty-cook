import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class MyTextField extends TextField {
  MyTextField({
    super.key,
    super.controller,
    String? hintText,
    super.keyboardType,
    super.textInputAction,
    super.maxLines = 1,
    Color color = constants.Colors.white,
    super.style,
  }) : super(
          decoration: InputDecoration(
            // labelText: hintText,
            hintText: hintText,
            filled: true,
            fillColor: color,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: constants.Colors.lightYellow, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8)
          ),
        );
}
