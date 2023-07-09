import 'package:flutter/material.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';

class TextFormPasswordFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String text;
  final bool isCheck;
  final bool isPassword;
  final bool isReadOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final Function()? onSuffix;
  final InputDecoration? decoration;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const TextFormPasswordFieldWidget({
    Key? key,
    required this.controller,
    required this.hint,
    required this.text,
    this.isPassword = false,
    this.autofocus = false,
    this.isCheck = true,
    this.isReadOnly = false,
    this.keyboardType,
    this.decoration,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onSuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly,
      obscureText: isPassword,
      onTap: onTap,
      autofocus: autofocus,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: decoration ??
          InputDecoration(
            isDense: true,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(bottom: 5),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorResource.mainColor,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFADADAD),
              ),
            ),
            labelText: hint,
            hintText: text,
            hintStyle: const TextStyle(
              color: Color(0xFFADADAD),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            labelStyle: const TextStyle(
              color: Color(0xFFADADAD),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: IconButton(
              onPressed: onSuffix,
              icon: Icon(
                isPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
      validator: (value) {
        if (isCheck) {
          return 'Password is not Empty';
        } else {
          return null;
        }
      },
    );
  }
}
