import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({super.key, required this.text, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Gap(24),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                height: 176,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      spreadRadius: 0,
                      blurRadius: 30,
                      offset: Offset(0, -5), // changes position of shadow
                    ),
                  ],
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: text,
                              color: color,
                              size: 12,
                              weight: FontWeight.w400,
                            ),
                            Gap(8),
                            CustomText(
                              text: 'Wed, 17 May | 08:30 AM',
                              color: Color.fromRGBO(97, 97, 97, 1),
                              size: 12,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.more_vert_outlined,
                          color: Color.fromRGBO(158, 158, 158, 1),
                        ),
                      ],
                    ),
                    Gap(12),
                    Divider(color: Color.fromRGBO(273, 273, 273, 1), height: 1),
                    Gap(14),
                    Row(
                      children: [
                        Image.asset(
                          'assets/home/doctor.png',
                          width: 75,
                          height: 75,
                        ),
                        Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Dr. Stella Kane',
                              color: AppColors.primaryText,
                              size: 16,
                              weight: FontWeight.w700,
                            ),
                            Gap(4),
                            CustomText(
                              text: 'Heart Surgeon - Flower Hospitals',
                              color: Color.fromRGBO(97, 97, 97, 1),
                              size: 12,
                              weight: FontWeight.w500,
                            ),
                            Gap(8),
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
