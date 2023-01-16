
import 'package:flutter/material.dart';
import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/decoration_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/style_resource.dart';

Widget textBottom(String text ,VoidCallback onPressed,) {
  return GestureDetector(
      onTap: onPressed,
      child: Text(text, style: StyleResource.instance.styleMedium(DimensionResource.fontSizeDefault, ColorResource.mainColor)));
}
Widget textBottomWithoutUnderLine(String text ,VoidCallback onPressed,) {
  return GestureDetector(
      onTap: onPressed,
      child: Text(text, style:StyleResource.instance.styleMedium(DimensionResource.fontSizeLarge, ColorResource.mainColor)));
}