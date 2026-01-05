import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/circle_widget.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Salah',
              size: 18,
              weight: FontWeight.w700,
              color: AppColors.primaryText,
            ),
            CustomText(
              text: 'How Are you Today?',
              size: 11,
              color: Color.fromRGBO(97, 97, 97, 1),
            ),
          ],
        ),
        CircleWidget(
          color: Color.fromRGBO(245, 245, 245, 2),
          width: 48,
          height: 48,
          child: Stack(
            children: [
              Center(child: SvgPicture.asset('assets/notification_icon.svg')),
              Positioned(
                top: 13,
                left: 27,
                child: CircleWidget(
                  color: Color.fromRGBO(255, 76, 94, 1),
                  width: 8,
                  height: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
