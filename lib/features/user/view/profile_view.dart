import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/user/data/cubit/user_cubit.dart';
import 'package:doctor_appointment/features/user/data/cubit/user_state.dart';
import 'package:doctor_appointment/shared/circle_widget.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..fetchUsers(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: AppColors.primaryColor,
          flexibleSpace: Padding(
            padding: EdgeInsetsGeometry.only(left: 16, right: 16, top: 30),
            child: Container(
              height: 40,
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.backgroundColor,
                        size: 20,
                      ),
                    ),
                    CustomText(
                      align: TextAlign.end,
                      text: 'Profile',
                      color: AppColors.backgroundColor,
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings_outlined,
                        color: AppColors.backgroundColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              final user = state.users.data;
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(color: AppColors.primaryColor),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Gap(85),
                                CustomText(
                                  text: user[0].name,
                                  size: 20,
                                  weight: FontWeight.w600,
                                  color: Color.fromRGBO(18, 18, 18, 1),
                                ),
                                Gap(8),
                                CustomText(
                                  text: user[0].email,
                                  size: 14,
                                  weight: FontWeight.w400,
                                  color: AppColors.primaryText,
                                ),
                                Gap(24),
                                Container(
                                  height: 59,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Center(
                                        child: CustomText(
                                          text: 'My Appointment',
                                          color: AppColors.primaryText,
                                          size: 12,
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.secondryColor,
                                        ),
                                      ),
                                      Center(
                                        child: CustomText(
                                          text: 'Medical records',
                                          color: AppColors.primaryText,
                                          size: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(24),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 16),
                                      height: 56,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color.fromRGBO(
                                              237,
                                              237,
                                              237,
                                              1,
                                            ),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Center(
                                            child: CircleWidget(
                                              width: 40,
                                              height: 40,
                                              color: Color.fromRGBO(
                                                234,
                                                242,
                                                255,
                                                1,
                                              ),
                                              child: Image.asset(
                                                'assets/auth/personal_card.png',
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                          Gap(13),
                                          CustomText(
                                            text: 'Personal Information',
                                            color: AppColors.primaryText,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(16),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 16),
                                      height: 56,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color.fromRGBO(
                                              237,
                                              237,
                                              237,
                                              1,
                                            ),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Center(
                                            child: CircleWidget(
                                              width: 40,
                                              height: 40,
                                              color: Color.fromRGBO(
                                                233,
                                                250,
                                                239,
                                                1,
                                              ),
                                              child: Image.asset(
                                                'assets/auth/directbox-notif.png',
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                          Gap(13),
                                          CustomText(
                                            text: 'My Test & Diagnostic',
                                            color: AppColors.primaryText,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(16),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 16),
                                      height: 56,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color.fromRGBO(
                                              237,
                                              237,
                                              237,
                                              1,
                                            ),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Center(
                                            child: CircleWidget(
                                              width: 40,
                                              height: 40,
                                              color: Color.fromRGBO(
                                                255,
                                                238,
                                                239,
                                                1,
                                              ),
                                              child: Image.asset(
                                                'assets/auth/wallet.png',
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                          Gap(13),
                                          CustomText(
                                            text: 'Payment',
                                            color: AppColors.primaryText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Positioned(
                    top: 110,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.backgroundColor,
                            width: 6,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage('assets/auth/avatar.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 205,
                    child: CircleWidget(
                      width: 28,
                      height: 28,
                      color: Color.fromRGBO(248, 248, 248, 1),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/auth/pine_icon.svg',
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
