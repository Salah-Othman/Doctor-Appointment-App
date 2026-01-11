import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../shared/container_btn.dart';
import '../../../shared/custom_text.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Gap(60),

            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ContainerBtn(
                    child: Center(child: Icon(Icons.arrow_back_ios_new)),
                  ),
                ),
                CustomText(
                  text: 'My Appointment',
                  color: AppColors.primaryText,
                  size: 18,
                  weight: FontWeight.w600,
                ),
                ContainerBtn(
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            Gap(34),

            
          ],
        ),
      ),
    );
  }
}
