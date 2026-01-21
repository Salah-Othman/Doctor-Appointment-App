import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/auth/view/login_view.dart';
import 'package:doctor_appointment/features/user/data/cubit/user_cubit.dart';
import 'package:doctor_appointment/features/user/data/cubit/user_state.dart';
import 'package:doctor_appointment/shared/custom_btn.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: CustomText(
            text: 'Setting',
            size: 18,
            weight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
          centerTitle: true,
        ),
        body: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is LogoutLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            } else if (state is LogoutLoaded) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (c) => LoginView()),
              );
            } else if (state is LogoutError) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(child: Text(state.message)),
              );
            }
          },
          child: Center(
            child: CustomBtn(
              onPressed: () {
                context.read<UserCubit>().logOut();
              },
              text: 'Log Out',
              width: 200,
              height: 59,
              bgColor: AppColors.primaryColor,
              foregroundColor: AppColors.backgroundColor,
              size: 18,
              weight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
