import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/auth/data/logic/auth_cubit.dart';
import 'package:doctor_appointment/features/auth/view/signup_view.dart';
import 'package:doctor_appointment/features/auth/widgets/check_box.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_account_text.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_form_field.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_header.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_rich_text.dart';
import 'package:doctor_appointment/features/auth/widgets/divider_widget.dart';
import 'package:doctor_appointment/features/auth/widgets/social_login.dart';
import 'package:doctor_appointment/features/home/view/home_view.dart';
import 'package:doctor_appointment/shared/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/network/api_error.dart';
import '../../../shared/custom_snack.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              builder: (_) => CircularProgressIndicator(),
            );
          } else if (state is AuthLoaded) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Account Login')));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
                customSnack(state.message is ApiError ? state.message : 'Unhandled login error'));
          }
        },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(130),

                /// Header
                CustomHeader(
                  title: 'Welcome Back',
                  description:
                      "We're excited to have you back, can't wait to\nsee what you've been up to since you last\nlogged in.",
                ),
                Gap(36),

                /// Fields
                Column(
                  children: [
                    /// Email Field
                    CustomFormField(
                      hint: 'Email',
                      controller: emailController,
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Gap(16),

                    /// Password Field
                    CustomFormField(
                      hint: 'Password',
                      controller: passwordController,
                      isPassword: true,
                      keyboardType: TextInputType.text,
                    ),
                    Gap(8),
                  ],
                ),

                /// Check Remember Password
                CheckBoxWidget(),
                Gap(32),

                /// Login Btn
                CustomBtn(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().login(email, password);

                    }
                  },
                  text: 'Login',
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  bgColor: AppColors.primaryColor,
                  foregroundColor: AppColors.backgroundColor,
                  size: 16,
                  weight: FontWeight.w600,
                ),
                Gap(46),

                /// divider
                DividerWidget(),
                Gap(40),

                /// Login icon
                SocialLogin(),
                Gap(40),

                /// Privacy Policy
                CustomRichText(),
                Gap(40),

                /// Go TO SignUP
                CustomAccountText(
                  text: ' Sign Up',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => SignupView()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
