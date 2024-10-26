import 'package:flutter/material.dart';

class TextFieldValue extends StatelessWidget {
  final double? topMargin;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final String hintText;
  final TextInputType? textInputType;
  final bool? isEnable;
  final Function(String?)? validate;
  final double? width;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final int? minLines;
  final String? initialValue;
  final int? maxLength;
  const TextFieldValue(
      {super.key,
        this.topMargin = 10,
        this.minLines,
        this.initialValue,
        this.suffixIcon,
        this.controller,
        this.obscureText = false,
        required this.hintText,
        this.isEnable,
        this.textInputType,
        this.validate,
        this.width,
        this.maxLines,
        this.contentPadding,
        this.maxLength
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: EdgeInsets.only(top: topMargin ?? 0),
      child: TextFormField(
        validator: (value) => (validate != null) ? validate!(value!) : null,
        obscureText: obscureText,
        controller: controller,
        initialValue: initialValue,
        keyboardType: textInputType,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          helperStyle: const TextStyle( fontSize: 10, ),
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ?? const EdgeInsets.only(left: 10, right: 10, top: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(style: BorderStyle.none, color: Color(0xFFE7E7EA)),
            gapPadding: 5,
          ),
          enabled: isEnable != null ? isEnable! : true,
          hintText: hintText,
          label: Text(
            hintText,
          ),
        ),
        minLines: minLines,
      ),
    );
  }
}