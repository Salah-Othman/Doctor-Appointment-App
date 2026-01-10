import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/home/data/model/speciality_model.dart';
import 'package:doctor_appointment/shared/circle_widget.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SpecialityWidget extends StatelessWidget {
  SpecialityWidget({super.key});
  final List<SpecialityModel> specialityList = [
    SpecialityModel(image: 'assets/speciality/General.png', text: 'General'),
    SpecialityModel(
      image: 'assets/speciality/Neurologic.png',
      text: 'Neurologic',
    ),
    SpecialityModel(
      image: 'assets/speciality/Pediatric.png',
      text: 'Pediatric',
    ),
    SpecialityModel(
      image: 'assets/speciality/Urologist.png',
      text: 'Radiology',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Gap(16),
        itemCount: specialityList.length,
        itemBuilder: (context, index) {
          final speciality = specialityList[index];
          return Container(
            width: 73,
            height: 86,
            decoration: BoxDecoration(color: AppColors.backgroundColor),
            child: Column(
              children: [
                CircleWidget(
                  width: 56,
                  height: 56,
                  color: Color.fromRGBO(244, 248, 255, 1),
                  child: Center(
                    child: Image.asset(speciality.image, width: 24, height: 24),
                  ),
                ),
                Gap(8),
                CustomText(
                  text: speciality.text,
                  size: 12,
                  weight: FontWeight.w400,
                  color: AppColors.primaryText,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
