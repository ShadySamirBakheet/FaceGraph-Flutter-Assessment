import 'package:chairs_factory/utils/themes/color.dart';
import 'package:flutter/material.dart';

class TextFormFieldApp extends StatelessWidget {
  TextFormFieldApp({
    Key? key,
    required this.title,
    this.keyType = TextInputType.name,
    required this.validator,
    required this.onSaved,
    this.controller,
    this.isPassword = false,
    this.isEnabled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.value,
    this.color,
    this.border,
    this.bColor,
    this.padding,
    this.onChanged,
  }) : super(key: key);

  final bool isPassword;
  final bool isEnabled;
  final String title;
  final String? value;
  final TextInputType keyType;
  final String? Function(String?) validator;
  final String? Function(String?)? onChanged;
  final Function(String?) onSaved;
  TextEditingController? controller;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? color;
  Color? bColor;
  InputBorder? border;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var borderSide =
        BorderSide(width: 2, color: Theme.of(context).primaryColor);

    border = border ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: borderSide,
        );
    color = color ?? AppColor.txtColor1;

    var style = TextStyle(fontSize: 16, color: color);

    if (value != null && value!.isNotEmpty) {
      if (controller != null) {
        controller!.text = value!;
      } else {
        controller = TextEditingController(text: value);
      }
    }

    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        minLines: 1,
        maxLines: 5,
        key: ValueKey(key),
        decoration: InputDecoration(
          filled: true,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border,
          focusedErrorBorder: border,
          disabledBorder: border,
          hintText: title,
          hintStyle: style,
          fillColor: bColor ?? AppColor.background,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        keyboardType: keyType,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
      ),
    );
  }
}
