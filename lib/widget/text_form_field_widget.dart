import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String text;
  final bool isCheck;
  final bool isEmail;
  final bool isPassword;
  final bool isReadOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final InputDecoration? decoration;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hint,
    required this.text,
    this.isEmail = false,
    this.isPassword = false,
    this.autofocus = false,
    this.isCheck = true,
    this.isReadOnly = false,
    this.keyboardType,
    this.decoration,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly,
      obscureText: isPassword,
      onTap: onTap,
      autofocus: autofocus,
      keyboardType: keyboardType ??
          (isEmail ? TextInputType.emailAddress : TextInputType.text),
      decoration: decoration ??
          InputDecoration(
            isDense: true,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(bottom: 5),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF651F6B),
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFADADAD),
              ),
            ),
            labelText: hint,
            hintText: text,
            suffix: suffixIcon,
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
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
      validator: (value) {
        if (isCheck) {
          return 'Field is not Empty';
        } else {
          return null;
        }
      },
    );
  }
}
