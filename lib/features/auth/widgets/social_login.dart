import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 202,
        height: 46,
        decoration: BoxDecoration(color: AppColors.backgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleWidget(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: 46,
              height: 46,
              child: Center(
                child: SvgPicture.asset(
                  'assets/auth/google_icon.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            CircleWidget(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: 46,
              height: 46,
              child: Center(
                child: SvgPicture.asset(
                  'assets/auth/facebook_icon.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            CircleWidget(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: 46,
              height: 46,
              child: Center(
                child: SvgPicture.asset(
                  'assets/auth/ios_icon.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
