import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? cursorColor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;


  const CustomTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.fillColor,
    this.textColor,
    this.hintColor,
    this.labelColor,
    this.cursorColor,
    this.prefixIconColor,
    this.suffixIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(color: textColor);

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Change the color here
        ),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: prefixIconColor,
        )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
          suffixIcon,
          color: suffixIconColor,
        )
            : null,
        fillColor: fillColor,
        filled: fillColor != null,
        hintStyle: TextStyle(color: hintColor),
        labelStyle: TextStyle(color: labelColor),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: validator,
      style: textStyle,
      cursorColor: cursorColor,
    );
  }
}
