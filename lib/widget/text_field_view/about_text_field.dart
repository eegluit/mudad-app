import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/decoration_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/style_resource.dart';


class AboutUsTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final String? error;
  final bool? showShadow;
  const AboutUsTextField({Key? key, this.controller, this.hintText, this.validator, this.error , this.showShadow,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: showShadow==true? BoxDecoration(
              boxShadow: DecorationResource.instance.containerBoxShadow(),
              color:  ColorResource.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: ColorResource.borderColor,
              )): BoxDecoration(
              color:  ColorResource.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: ColorResource.borderColor,
              )),
          child: TextFormField(
            controller: controller,
            minLines: 6,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            cursorColor: ColorResource.mainColor,
            style: StyleResource.instance.styleRegular(DimensionResource.fontSizeDefault, ColorResource.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText ?? "Please enter your message".tr,
                hintStyle: StyleResource.instance.styleLight(DimensionResource.fontSizeDefault, ColorResource.textColor),
                contentPadding: const EdgeInsets.only(left: 10, right: 15),
                errorText: "",
                errorStyle: const TextStyle(height: 0,)),
            validator: validator,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Visibility(
                  visible: error == null || error == "" ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 2, bottom: 5),
                    child: Text(
                      error!,
                      style: StyleResource.instance.styleRegular(DimensionResource.fontSizeSmall, ColorResource.errorColor),
                      textAlign: TextAlign.start,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text("Text has a maximum 400 characters".tr,
                  style: StyleResource.instance.styleRegular(DimensionResource.fontSizeSmall, ColorResource.textColor_3).copyWith(height: 1,)),
            ),
          ],
        ),
      ],
    );
  }
}
