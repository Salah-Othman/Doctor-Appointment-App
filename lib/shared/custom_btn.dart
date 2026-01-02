import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.onPressed,
    required this.text,
    this.color,
    this.weight,
    this.size,
    required this.width,
    required this.height,
    this.bgColor,
    this.foregroundColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final double width;
  final double height;
  final Color? bgColor;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: foregroundColor,
        fixedSize: Size(width, height),
      ),
      child: CustomText(text: text, color: color, weight: weight, size: size),
    );
  }
}
