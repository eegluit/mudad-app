import 'package:flutter/material.dart';

import 'font_resource.dart';

FontWeight semiBold = FontWeight.w600;
FontWeight regular = FontWeight.w400;
FontWeight light = FontWeight.w200;
FontWeight medium = FontWeight.w500;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w900;

class StyleResource {
  static StyleResource? _instance;
  static StyleResource get instance => _instance ??= StyleResource._init();

  StyleResource._init();

  TextStyle styleExtraBold(double fontSize, Color color) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: FontResource.instance.mainFont,
        fontWeight: extraBold);
  }

  TextStyle styleBold(double fontSize, Color color) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: FontResource.instance.mainFont,
        fontWeight: bold);
  }

  TextStyle styleSemiBold(double fontSize, Color color) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: FontResource.instance.mainFont,
        fontWeight: semiBold);
  }

  TextStyle styleRegular(double fontSize, Color color) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: FontResource.instance.mainFont,
        fontWeight: regular);
  }

  TextStyle styleMedium(double fontSize, Color color) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: FontResource.instance.mainFont,
        fontWeight: semiBold);
  }
  TextStyle styleLight(double fontSize, Color color) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: FontResource.instance.mainFont,
        fontWeight: light);
  }
}
