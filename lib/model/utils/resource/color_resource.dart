import 'dart:ui';

import 'package:flutter/material.dart';

class ColorResource {
  static ColorResource? _instance;

  static ColorResource get instance => _instance ??= ColorResource._init();

  ColorResource._init();

  static const Color transparent = Color(0x00ffffff);
  static const Color secondColor = Color(0xff1F306B);
  static const Color mainColor = Color(0xff651F6B);
  static const Color lightMainColor = Color(0xffD009E1);
  static const Color transactionColor = Color(0xffF8D7FB);
  static const Color orangeColor = Color(0xffFE8226);

  static const Color textColor = Color(0xff222222);
  static const Color textColor_2 = Color(0xffADADAD);
  static const Color textColor_3 = Color(0xff707070);
  static const Color textColor_4 = Color(0xff647580);
  static const Color textColor_5 = Color(0xff666666);
  static const Color textColor_6 = Color(0xff5F5F5F);
  static const Color textColor_7 = Color(0xff5D5D5D);

  static const Color textHintColor = Color(0xff707070);

  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);

  static const Color borderColor = Color(0xffEDEDED);
  static const Color lightBorderColor = Color(0xffF5F5F5);
  static const Color borderTextField2 = Color(0xffADADAD);

  static const Color borderTextField = Color(0xffEEEEEE);
  static const Color lineGreyColor = Color(0xffF5F5F5);
  static const Color lineGrey2Color = Color(0xffE7E7E7);

  static const Color boxColor = Color(0xffFCFCFC);
  static const Color lightGrey = Color(0xffC9C9C9);
  static const Color grey = Color(0xff9CA0A6);
  static const Color grey_1 = Color(0xffF7F7F7);
  static const Color grey_2 = Color(0xffE7E7E7);
  static const Color grey_3 = Color(0xffD2D2D2);
  static const Color extraDoubleLightGrey = Color(0xffFCFCFC);
  static const Color darkGrey = Color(0xff707070);
  static const Color boxShadow = Color(0xffE4E4E4);

  static const Color star = Color(0xfff1b90a);
  static const Color tabBarBackGroundColor = Color(0xffF2F2F2);

  static const Color blueColor = Color(0xff3382DF);

  static const Color buttonGreenColor = Color(0xff38B77B);
  static const Color greenColor = Color(0xff1FD14A);
  static const Color darkGreenColor = Color(0xff15A10F);

  static const Color textRedColor = Color(0xffF81F0C);
  static const Color buttonRedColor = Color(0xffFF3334);
  static const Color errorColor = Color(0xffEC3C3C);
  static const Color lightErrorColor = Color(0xffF84D4D);
  static const Color offerColor = Color(0xffFF3131);
  static const Color darkRed = Color(0xffF84D4D);
  static const Color lightRed = Color(0xffFF7C7C);
  static const Color dimLightRed = Color(0xffFFEEEE);

  static const Color lightYellow = Color(0xffF7B34C);
  static const Color dimLightYellow = Color(0xffFFF5E6);
}
