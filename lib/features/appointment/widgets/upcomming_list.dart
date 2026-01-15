import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpcommingList extends StatelessWidget {
  const UpcommingList({super.key});

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
                    height: 181,
                    width: double.infinity,
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
                        Container(
                          padding: EdgeInsets.only(bottom: 16),
                          height: 95,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.secondryColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/home/doctor.png'),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  CustomText(
                                    text: 'Wed, 17 May | 08:30 AM',
                                    color: Color.fromRGBO(97, 97, 97, 1),
                                    size: 12,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chat_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        Gap(6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
                          children: [
                            ElevatedButton(
                              onPressed: () {},
      
                              style: ElevatedButton.styleFrom(
                                // fixedSize: Size(160, 38),
                                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  side: BorderSide(color: AppColors.primaryColor),
                                ),
                              ),
                              child: CustomText(
                                text: 'Cancel Appointment',
                                color: AppColors.primaryColor,
                                size: 12,
                                weight: FontWeight.w600,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                // fixedSize: Size(160, 38),
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  side: BorderSide(color: AppColors.primaryColor),
                                ),
                              ),
                              child: CustomText(
                                text: 'Reschedule',
                                color: AppColors.backgroundColor,
                                size: 12,
                                weight: FontWeight.w600,
                              ),
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