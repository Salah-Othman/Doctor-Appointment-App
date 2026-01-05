import 'package:flutter/material.dart';

class ContainerBtn extends StatelessWidget {
  const ContainerBtn({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color.fromRGBO(245, 245, 245, 1), width: 2),
      ),
      child: child,
    );
  }
}
