import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyle(color: AppColors.secondryColor, fontSize: 11),
          ),

          TextSpan(
            text: ' Terms & Conditions ',
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
          TextSpan(
            text: 'and ',
            style: TextStyle(color: AppColors.secondryColor, fontSize: 11),
          ),

          TextSpan(
            text: ' \nPrivacyPolicy.',
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
