import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/container_btn.dart';
import 'package:flutter/material.dart';

import '../../../shared/custom_text.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title:CustomText(
          text: 'Notification',
          color: AppColors.primaryText,
          size: 18,
          weight: FontWeight.w600,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: ContainerBtn(
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
