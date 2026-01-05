import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAccountText extends StatelessWidget {
  const CustomAccountText({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: 'Already have an account yet?',
          size: 11,
          weight: FontWeight.w400,
          color: AppColors.primaryText,
        ),

        GestureDetector(
          onTap: onTap,
          child: CustomText(
            text: text,
            size: 11,
            weight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
