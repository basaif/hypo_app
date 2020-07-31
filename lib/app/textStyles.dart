import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {

  static const TextStyle logo = const TextStyle(
    fontSize: 29,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    color: ColorSets.primaryGreen,
    fontFamily: "Segoe UI",
  );

  static const TextStyle pageHeadlines = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    color: ColorSets.white,
    fontFamily: "Segoe UI",
  );

  static const TextStyle bodyHeadlines = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    color: ColorSets.darkGrey,
    fontFamily: "Segoe UI",
  );

  static const TextStyle buttons = const TextStyle(
    fontSize: 16,
    color: ColorSets.white,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    fontFamily: "Segoe UI",
  );

  static const TextStyle links = const TextStyle(
    fontSize: 15,
    color: ColorSets.primaryGreen,
    fontFamily: "Segoe UI",
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
    decorationColor:ColorSets.primaryGreen,
    decorationStyle: TextDecorationStyle.solid,
  );

  static const TextStyle hintText = const TextStyle(
    fontSize: 15,
    color: ColorSets.grey,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    fontFamily: "Segoe UI",
  );

  static const TextStyle inputText = const TextStyle(
    fontSize: 15,
    color: ColorSets.darkGrey,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    fontFamily: "Segoe UI",
  );

  static const TextStyle bodyText = const TextStyle(
    fontSize: 14,
    color: ColorSets.grey,
    fontFamily: "Segoe UI",
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle highlightedBodyText = const TextStyle(
    fontSize: 14,
    color: ColorSets.primaryGreen,
    fontFamily: "Segoe UI",
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle measurementText = const TextStyle(
    fontSize: 26,
    color: ColorSets.grey,
    fontFamily: "Segoe UI",
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle languageOptions = const TextStyle(
    fontSize: 20,
    color: ColorSets.darkGrey,
    fontFamily: "Segoe UI",
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );
}