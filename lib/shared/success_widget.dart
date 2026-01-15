import 'package:doctor_appointment/root.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/constants/app_colors.dart';

class SuccessWidget extends StatefulWidget {
  final String userName;
  const SuccessWidget({super.key, required this.userName});

  @override
  State<SuccessWidget> createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => Root(userName: widget.userName)),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             width: 150,
             height: 150,
             decoration: BoxDecoration(
               color: AppColors.primaryColor,
               borderRadius: BorderRadius.circular(100),
             ),
             child: Icon(Icons.check, color: AppColors.backgroundColor, size: 70,),
           ),
          Gap(24),
           CustomText(text: 'Login Successful', size: 24, weight: FontWeight.w700, color: AppColors.primaryText,),
         ],
       ),
     ),
    );
  }
}
