import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/custom_btn.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 197,
      decoration: BoxDecoration(color: AppColors.backgroundColor),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: MediaQuery.of(context).size.width,
                height: 167,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CustomText(
                      text: 'Book and\nschedule with\nnearest doctor',
                      size: 18,
                      weight: FontWeight.w500,
                      color: AppColors.backgroundColor,
                    ),
                    Gap(10),
                    CustomBtn(
                      onPressed: () {},
                      text: 'Find Nearby',
                      width: 120,
                      height: 38,
                      size: 12,
                      weight: FontWeight.w400,
                      bgColor: AppColors.backgroundColor,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            child: Image.asset('assets/home/card.png', width: 136, height: 197),
          ),
        ],
      ),
    );
  }
}
