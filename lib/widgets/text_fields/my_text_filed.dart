import 'package:flutter/material.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

class MyTextField extends TextFormField {
  MyTextField({
    super.key,
    super.controller,
    String? hintText,
    super.keyboardType,
    super.textInputAction,
    super.maxLines = 1,
    Color color = constants.Colors.white,
    super.style,
    super.onChanged,
    super.obscureText,
    super.enableSuggestions,
    super.autocorrect,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    Widget? icon,
    Color? iconColor,
    super.autofocus,
  }) : super(
          decoration: InputDecoration(
            // labelText: hintText,
            hintText: hintText,
            filled: true,
            fillColor: color,
            icon: icon,
            iconColor: iconColor,
            enabledBorder: enabledBorder ?? const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
            focusedBorder: focusedBorder ?? const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
              borderSide: BorderSide(
                color: constants.Colors.lightYellow,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
          ),
        );
}
