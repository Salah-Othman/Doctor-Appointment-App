import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 107,
          height: 1,
          decoration: BoxDecoration(color: Color.fromRGBO(224, 224, 224, 1)),
        ),
        CustomText(
          text: ' Or sign in with ',
          size: 12,
          weight: FontWeight.w400,
          color: Color.fromRGBO(158, 158, 158, 1),
        ),
        Container(
          width: 107,
          height: 1,
          decoration: BoxDecoration(color: Color.fromRGBO(224, 224, 224, 1)),
        ),
      ],
    );
  }
}
