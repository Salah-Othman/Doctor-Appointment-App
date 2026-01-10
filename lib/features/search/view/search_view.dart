import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_text.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Gap(40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.primaryText,
                  ),
                ),
                Gap(90),
                CustomText(
                  align: TextAlign.center,
                  text: 'Search',
                  color: AppColors.primaryText,
                  weight: FontWeight.w600,
                  size: 18,
                ),
              ],
            ),
            Gap(32),
          ],
        ),
      ),
    );
  }
}
