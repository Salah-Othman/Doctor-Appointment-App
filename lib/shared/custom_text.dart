import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.weight,
    this.size,
    this.align,
  });
  final String text;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    );
  }
}
