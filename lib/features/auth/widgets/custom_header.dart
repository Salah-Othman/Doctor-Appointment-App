import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.backgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            color: AppColors.primaryColor,
            size: 24,
            weight: FontWeight.w700,
          ),
          Gap(8),
          CustomText(
            text: description,
            color: AppColors.secondryColor,
            size: 14,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
