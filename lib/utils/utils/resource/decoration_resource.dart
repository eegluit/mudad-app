import 'package:flutter/material.dart';

import 'color_resource.dart';
import 'dimensions_resource.dart';

class DecorationResource {
  static DecorationResource? _instance;

  static DecorationResource get instance => _instance ??= DecorationResource._init();

  DecorationResource._init();
  BoxDecoration decorationSearchBar() {
    return BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey.withOpacity(0.2), offset: const Offset(4, 4), blurRadius: 20),
        ],
        color: ColorResource.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorResource.borderColor, width: 1));
  }

  BoxDecoration decorationFilterSpinnerNoRadius() {
    return BoxDecoration(
      border: Border.all(color: const Color(0xffFFDDDD), width: 1),
    );
  }
  BoxDecoration decorationRedRoundedCorner() {
    return BoxDecoration(
        color: ColorResource.mainColor,
        border: Border.all(color: ColorResource.mainColor, width: 1),
        borderRadius: BorderRadius.circular(4));
  }


  BoxDecoration decorationGreenRoundedCorner() {
    return BoxDecoration(
        color: ColorResource.greenColor,
        border: Border.all(color: ColorResource.greenColor, width: 1),
        borderRadius: BorderRadius.circular(4));
  }
  BoxDecoration decorationTextFieldRadius() {
    return BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorResource.borderTextField2, width: 0.5));
  }
  BoxDecoration decorationTextFieldRoundedCorner() {
    return BoxDecoration(
        color: ColorResource.white,
        border: Border.all(color: ColorResource.borderColor, width: 1),
        borderRadius: BorderRadius.circular(DimensionResource.buttonRadius));
  }



  BoxDecoration decorationTextFieldNoRadius() {
    return BoxDecoration(
        color: ColorResource.white,
        border: Border.all(color: ColorResource.borderTextField, width: 1));
  }

  BoxDecoration decorationSearchNoRadius() {
    return BoxDecoration(
        color: ColorResource.white,
        border: Border.all(color: ColorResource.borderTextField, width: 2));
  }

  OutlineInputBorder outLineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(DimensionResource.buttonRadius),
        borderSide: const BorderSide(color: ColorResource.borderColor, width: 1));
  }

  OutlineInputBorder outLineBorderNoRadius() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: ColorResource.borderTextField, width: 1));
  }

  BoxDecoration decorationImage({required String image}) {
    return BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill));
  }

  BoxDecoration decorationTopLineGrey(Color color) {
    return BoxDecoration(
        color: ColorResource.white,
        border: Border(
          top: BorderSide(color: color, width: 1.0,),
        ));
  }
  List<BoxShadow> containerBoxShadow(){
    return const [BoxShadow(
      color: ColorResource.boxShadow,
      blurRadius: 10.0,
    ),];
  }
}
