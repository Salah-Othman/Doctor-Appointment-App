import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          size: 18,
          weight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomText(
            text: 'See All',
            size: 12,
            weight: FontWeight.w400,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
