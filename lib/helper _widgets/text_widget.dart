import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight bold;
  final FontStyle? style;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final TextOverflow? overflow;

  const TextWidget(
      {Key? key,
      required this.text,
      required this.size,
      this.color,
      required this.bold,
      this.alignment,
      this.decoration,
      this.style,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: bold,
          overflow: overflow,
          decoration: decoration,
          fontStyle: style),

      textAlign: alignment,
    );
  }
}
