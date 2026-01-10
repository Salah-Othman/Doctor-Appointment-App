import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/auth/widgets/check_box.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_account_text.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_form_field.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_header.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_rich_text.dart';
import 'package:doctor_appointment/features/auth/widgets/divider_widget.dart';
import 'package:doctor_appointment/features/auth/widgets/social_login.dart';
import 'package:doctor_appointment/features/home/view/home_view.dart';
import 'package:doctor_appointment/root.dart';
import 'package:doctor_appointment/shared/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../home/view/home_view.dart';
import '../data/logic/auth_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // double sizeWidth = MediaQuery.of(context).size.width;
    // double sizeHeight = MediaQuery.of(context).size.height;

    // print('width = $sizeWidth');
    // print('Height = $sizeHeight');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignInLoaded) {
            final user = state.user;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login Success')));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => Root(),
              )
            );
          } else if (state is SignInError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap(94),

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
                            context.read<AuthCubit>().signIn(email, password);
                          }
                        },
                        text: state is SignInLoading ? 'Loading' : 'Login',
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
                      Gap(32),

                      /// Login icon
                      SocialLogin(),
                      Gap(32),

                      /// Privacy Policy
                      CustomRichText(),
                      Gap(24),

                      /// Go TO SignUp
                      CustomAccountText(
                        text: ' Sign Up',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (c) => HomeView()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
