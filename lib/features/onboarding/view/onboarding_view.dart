import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/custom_btn.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:doctor_appointment/test/bloc/fetch_bloc.dart';
import 'package:doctor_appointment/test/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../auth/view/login_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        children: [
          Positioned(
            top: 144,
            right: 2,
            child: Image.asset(
              'assets/onboarding/background.png',
              height: 443,
              width: 443,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(65),
              SvgPicture.asset('assets/logo.svg', width: 141, height: 38),
              Gap(50),
              Center(
                child: Image.asset(
                  'assets/onboarding/doctor.png',
                  height: 491,
                  width: 375,
                ),
              ),
            ],
          ),
          Positioned(
            top: 410,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 239,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0),

                    Color.fromRGBO(255, 255, 255, 0.5),
                    Color.fromRGBO(255, 255, 255, 0.5),

                    Color.fromRGBO(255, 255, 255, 1),

                    Color.fromRGBO(255, 255, 255, 1),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 57,
            right: 0,
            left: 0,
            child: Column(
              children: [
                CustomText(
                  text: 'Best Doctor\nAppointment App',
                  align: TextAlign.center,
                  size: 32,
                  weight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
                Gap(24),
                CustomText(
                  text:
                      'Manage and schedule all of your medical appointments easily\nwith Docdoc to get a new experience.',
                  align: TextAlign.center,
                  size: 10,
                  weight: FontWeight.w400,
                  color: AppColors.secondryColor,
                ),
                Gap(55),
                CustomBtn(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (c) => LoginView(),
                        ));

                  },
                  text: 'Get Started',
                  width: 311,
                  height: 52,
                  bgColor: AppColors.primaryColor,
                  color: AppColors.backgroundColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
