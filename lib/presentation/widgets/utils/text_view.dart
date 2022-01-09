import 'package:chairs_factory/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  TextView({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.action,
    this.padding = const EdgeInsets.all(8),
    this.icon,
    this.style,
    this.maxline,
  }) : super(key: key);

  final String text;
  final TextAlign textAlign;
  TextStyle? style =
      AppStyle().textStyle1.copyWith(fontSize: 20, fontWeight: FontWeight.bold);
  Function()? action;
  final EdgeInsetsGeometry padding;
  Icon? icon;

  int? maxline;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: padding,
        child: Text(
          text,
          style: style,
          textAlign: textAlign,
          maxLines: maxline,
        ),
      ),
    );
  }
}
