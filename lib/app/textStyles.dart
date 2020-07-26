import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {

  static const TextStyle logo = const TextStyle(
    fontSize: 29,
    color: ColorSets.primaryGreen,
    fontFamily: "Segoe UI",
  );

  static const TextStyle pageHeadlines = const TextStyle(
    fontSize: 24,
    color: ColorSets.white,
    fontFamily: "Segoe UI",
  );

  static const TextStyle bodyHeadlines = const TextStyle(
    fontSize: 16,
    color: ColorSets.darkGrey,
    fontFamily: "Segoe UI",
  );

  static const TextStyle buttons = const TextStyle(
    fontSize: 16,
    color: ColorSets.white,
    fontWeight: FontWeight.bold,
    fontFamily: "Segoe UI",
  );

  static const TextStyle links = const TextStyle(
    fontSize: 15,
    color: ColorSets.primaryGreen,
    fontFamily: "Segoe UI",
    decoration: TextDecoration.underline,
    decorationColor:ColorSets.primaryGreen,
    decorationStyle: TextDecorationStyle.solid,
  );

  static const TextStyle hintText = const TextStyle(
    fontSize: 15,
    color: ColorSets.grey,
    fontFamily: "Segoe UI",
  );

  static const TextStyle bodyText = const TextStyle(
    fontSize: 14,
    color: ColorSets.grey,
    fontFamily: "Segoe UI",
  );

  static const TextStyle highlightedBodyText = const TextStyle(
    fontSize: 14,
    color: ColorSets.primaryGreen,
    fontFamily: "Segoe UI",
  );

  static const TextStyle measurementText = const TextStyle(
    fontSize: 26,
    color: ColorSets.grey,
    fontFamily: "Segoe UI",
  );
}