import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/auth/widgets/user_widget.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                        CustomText(
                          align: TextAlign.center,
                          text: 'Profile',
                          color: AppColors.backgroundColor,
                          weight: FontWeight.w600,
                          size: 18,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings_outlined,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            UserWidget(),



        ],
      ),
          Positioned(
            top: 160,
            right: 120,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.backgroundColor, width: 6),
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage('assets/auth/avatar.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            right: 130,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color.fromRGBO(248, 248, 248, 1),
                borderRadius: BorderRadius.circular(36),
                border: Border.all(color: AppColors.backgroundColor, width: 2),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/auth/pine_icon.svg',
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),


        ]
      ),
    );
  }
}
