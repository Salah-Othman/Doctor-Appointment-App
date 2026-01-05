import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hint,
    required this.controller,
    required this.isPassword, this.keyboardType,
  });
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please Fill $hint';
        }
        return null;
      },
      cursorColor: Colors.black,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(253, 253, 253, 1),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color.fromRGBO(237, 237, 237, 1),
            width: 1,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Color.fromRGBO(194, 194, 194, 1),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
