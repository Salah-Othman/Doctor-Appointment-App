import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/auth/data/logic/auth_cubit.dart';
import 'package:doctor_appointment/features/auth/view/login_view.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_account_text.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_form_field.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_header.dart';
import 'package:doctor_appointment/features/auth/widgets/custom_rich_text.dart';
import 'package:doctor_appointment/features/auth/widgets/divider_widget.dart';
import 'package:doctor_appointment/features/auth/widgets/social_login.dart';
import 'package:doctor_appointment/shared/custom_btn.dart';
import 'package:doctor_appointment/shared/custom_snack.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    color: AppColors.primaryColor,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: CustomText(
                      text: 'LogIn Now',
                      color: AppColors.backgroundColor,
                      weight: FontWeight.w700,
                      size: 24,
                    ),
                  ),
                ),
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => LoginView()),
            );
          } else if (state is SignUpError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(customSnack(state.message));
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
                      Gap(60),

                      /// Header
                      CustomHeader(
                        title: 'Create Account',
                        description:
                            "Sign up now and start exploring all that our\napp has to offer. We're excited to welcome\nyou to our community!",
                      ),
                      Gap(17),

                      /// Fields
                      Column(
                        children: [
                          /// Name field
                          CustomFormField(
                            hint: 'Username',
                            controller: nameController,
                            isPassword: false,
                            keyboardType: TextInputType.name,
                          ),
                          Gap(10),

                          /// Email field
                          CustomFormField(
                            hint: 'Email',
                            controller: emailController,
                            isPassword: false,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Gap(10),

                          /// Phone field
                          CustomFormField(
                            hint: 'Your Number',
                            controller: phoneController,
                            isPassword: false,
                            keyboardType: TextInputType.number,
                          ),
                          Gap(12),

                          /// Gender field
                          CustomFormField(
                            hint: 'Your Gender',
                            controller: genderController,
                            isPassword: false,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Gap(8),

                          /// Password field
                          CustomFormField(
                            hint: 'Password',
                            controller: passwordController,
                            isPassword: true,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Gap(8),

                          /// Password Confirm field
                          CustomFormField(
                            hint: 'Confirm Password',
                            controller: confirmPasswordController,
                            isPassword: true,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Gap(16),
                        ],
                      ),

                      /// SignUp Btn
                      CustomBtn(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().signUp(
                              nameController.text.trim(),
                              emailController.text.trim(),
                              phoneController.text.trim(),
                              genderController.text.trim(),
                              passwordController.text.trim(),
                              confirmPasswordController.text.trim(),
                            );
                          }
                        },
                        text: state is SignInLoading
                            ? 'Loading.....'
                            : 'Create Account',
                        width: MediaQuery.of(context).size.width,
                        height: 52,
                        bgColor: AppColors.primaryColor,
                        foregroundColor: AppColors.backgroundColor,
                        size: 16,
                        weight: FontWeight.w600,
                      ),
                      Gap(16),

                      /// divider
                      DividerWidget(),
                      Gap(16),

                      /// Login icon
                      SocialLogin(),
                      Gap(16),

                      /// Privacy Policy
                      CustomRichText(),
                      Gap(8),

                      /// Go TO SignUP
                      CustomAccountText(
                        text: ' Login',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (c) => LoginView()),
                          );
                        },
                      ),
                      Gap(8),
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
