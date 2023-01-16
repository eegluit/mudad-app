import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/utils/resource/color_resource.dart';
import '../../utils/utils/resource/decoration_resource.dart';
import '../../utils/utils/resource/dimensions_resource.dart';
import '../../utils/utils/resource/style_resource.dart';

class CommonTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final Function(String)? onFieldSubmitted;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final String? iconData;
  final bool? obscureText;
  final Widget? prefixIcon;
  final bool? readOnly;
  final bool? showShadow;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Color? containerColor;
  final Color? cursorColor;
  final Color? outLineColor;
  final Color? hintColor;
  final Color? errorColor;
  final int? maxLength;
  final bool? suffixIcon;
  final Widget? suffixIconWidget;
  final Function(String)? onValueChanged;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? label;
  final Widget? trailWidget;
  CommonTextField({
    Key? key,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.onFieldSubmitted,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.showShadow,
    this.iconData,
    this.obscureText,
    this.prefixIcon,
    this.inputFormatters,
    this.controller,
    this.containerColor,
    this.cursorColor,
    this.outLineColor,
    this.hintColor,
    this.errorColor,
    this.maxLength,
    this.suffixIconWidget,
    this.onValueChanged,
    this.style,
    this.hintStyle,
    this.label,
    this.trailWidget,
    this.readOnly,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  RxBool passwordVisible = true.obs;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.label != null ? true : false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label ?? "",
                style: StyleResource.instance.styleMedium(DimensionResource.fontSizeExtraLarge, ColorResource.secondColor),
                textAlign: TextAlign.start,
              ),
              widget.trailWidget ?? const SizedBox()
            ],
          ),
        ),
        Visibility(
            visible: widget.label != null ? true : false,
            child: const SizedBox(
              height: 6,
            )),
        Container(
          height: 50,
          decoration: const BoxDecoration(
              color: ColorResource.transparent,
              border: Border(
                bottom: BorderSide(
                    color: ColorResource.borderTextField2, width: 1.5),
              )),
          child: TextFormField(
            controller: widget.controller,
            obscuringCharacter: '●',
            readOnly: widget.readOnly ?? false,
            inputFormatters: widget.inputFormatters,
            textInputAction: widget.textInputAction??TextInputAction.next,
            keyboardType: widget.keyboardType,
            maxLength: widget.maxLength,
            onChanged: widget.onValueChanged,
            obscureText: widget.suffixIcon == true ? passwordVisible.value : false,
            cursorColor: ColorResource.mainColor,
            style: StyleResource.instance.styleRegular(DimensionResource.fontSizeExtraLarge, ColorResource.textColor),
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                hintText: widget.hintText,
                counterText: "",
                hintStyle: StyleResource.instance.styleRegular(DimensionResource.fontSizeLarge, ColorResource.textColor_2),
                border: InputBorder.none,
                suffixIcon: widget.suffixIcon == true
                    ? IconButton(
                  icon: Icon(
                    passwordVisible.value ? Icons.visibility_off : Icons.visibility,
                    color: passwordVisible.value ? ColorResource.borderTextField2 : ColorResource.mainColor,
                    size: 25,
                  ),
                  onPressed: () {
                    passwordVisible.value = !passwordVisible.value;
                    setState(() {

                    });
                  },
                )
                    : widget.suffixIconWidget == null
                    ? const SizedBox()
                    : widget.suffixIconWidget!,
                errorText: "",
                errorStyle: const TextStyle(
                  height: 0,
                )),
            validator: widget.validator,
          ),
        ),
        widget.errorText == null || widget.errorText == ""
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
                child: Text(
                  widget.errorText!,
                  style: StyleResource.instance.styleRegular(DimensionResource.fontSizeSmall, ColorResource.errorColor),
                  textAlign: TextAlign.start,
                ),
              ),
      ],
    );
  }
}
