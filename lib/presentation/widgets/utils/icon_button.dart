import 'package:flutter/material.dart';

class IconButtonApp extends StatelessWidget {
  final Function() action;
  Widget icon;
  bool isFullWidth = false;
  Color? bcolor;
  TextStyle style;

  IconButtonApp({
    Key? key,
    required this.action,
    required this.icon,
    this.isFullWidth = false,
    this.bcolor,
    this.style = const TextStyle(fontSize: 20, color: Colors.white),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bcolor = (bcolor == null) ? Theme.of(context).primaryColor : bcolor;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: bcolor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: icon,
        ),
      ),
      onTap: action,
    );
  }
}
