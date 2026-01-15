import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  late bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 137,
          height: 36,
          decoration: BoxDecoration(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isCheck,
                onChanged: (bool ? v) {
                 setState(() {
                   isCheck = v ?? false;
                 });
                 isCheck ?
                     widget.onPressed!()
                     : null;
                },
                activeColor: AppColors.primaryColor,
                side: BorderSide(
                  width: 2,
                  color: Color.fromRGBO(169, 178, 185, 1),
                ),
              ),
              CustomText(
                text: 'Remember me',
                color: Color.fromRGBO(158, 158, 158, 1),
                size: 12,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: widget.onPressed,
          child: CustomText(
            text: 'Forgot Password?',
            color: AppColors.primaryColor,
            size: 12,
          ),
        ),
      ],
    );
  }
}
