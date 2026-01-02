import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
    required this.width,
    required this.height,
    this.color,
    this.child,
  });
  final double width;
  final double height;
  final Color? color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: child,
    );
  }
}
