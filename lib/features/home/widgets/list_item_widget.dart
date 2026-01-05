import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({super.key, required this.height, required this.itemCount});

  final double height;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 12),
        separatorBuilder: (context, index) => Gap(16),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: 126,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/home/doctor.png',
                      width: 110,
                      height: 110,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Dr. Randy Wigham',
                        color: AppColors.primaryText,
                        size: 16,
                        weight: FontWeight.w700,
                      ),
                      Gap(6),
                      Row(
                        children: [
                          CustomText(
                            text: 'General',
                            weight: FontWeight.w500,
                            size: 12,
                            color: AppColors.secondryColor,
                          ),
                          Gap(8),
                          CustomText(
                            text: '|',
                            weight: FontWeight.w500,
                            size: 12,
                            color: AppColors.secondryColor,
                          ),
                          Gap(8),
                          CustomText(
                            text: 'RSUD Gatot Subroto',
                            weight: FontWeight.w500,
                            size: 12,
                            color: AppColors.secondryColor,
                          ),
                        ],
                      ),
                      Gap(6),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color.fromRGBO(255, 214, 0, 1),
                            size: 16,
                          ),
                          Gap(4),
                          CustomText(
                            text: '4.8',
                            weight: FontWeight.w500,
                            size: 12,
                            color: AppColors.secondryColor,
                          ),
                          Gap(4),
                          CustomText(
                            text: '(4,279 reviews)',
                            weight: FontWeight.w500,
                            size: 12,
                            color: AppColors.secondryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
