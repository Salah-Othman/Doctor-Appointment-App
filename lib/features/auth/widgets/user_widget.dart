import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/auth/data/logic/auth_cubit.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (_) => AuthCubit()..fetchUsers(),
    child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if(state is GetUserLoading){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is GetUserSuccess) {
            final user = state.users;
            return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 501,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Gap(65),
                  CustomText(
                    text:'name' ,
                    weight: FontWeight.w600,
                    size: 20,
                    color: Color.fromRGBO(18, 18, 18, 1),
                  ),
                  Gap(8),
                  CustomText(
                    text: 'user.email',
                    weight: FontWeight.w400,
                    size: 14,
                    color: AppColors.primaryText,
                  ),
                  Gap(24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 59,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 248, 248, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 155,
                            height: 58,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: CustomText(text: 'My Appointment'),
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(237, 237, 237, 1),
                            ),
                          ),
                          Container(
                            width: 155,
                            height: 58,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: CustomText(text: 'Medical records'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(234, 242, 255, 1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/auth/personal_card.png',
                                ),
                              ),
                            ),
                            Gap(13),
                            CustomText(text: 'Personal Information'),
                          ],
                        ),
                        Gap(8),
                        Divider(color: Color.fromRGBO(237, 237, 237, 1)),
                        Gap(16),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(233, 250, 239, 1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/auth/directbox-notif.png',
                                ),
                              ),
                            ),
                            Gap(13),
                            CustomText(text: 'My Test & Diagnostic'),
                          ],
                        ),
                        Gap(8),
                        Divider(color: Color.fromRGBO(237, 237, 237, 1)),
                        Gap(16),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 238, 239, 1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Image.asset('assets/auth/wallet.png'),
                              ),
                            ),
                            Gap(13),
                            CustomText(text: 'Payment'),
                          ],
                        ),
                        Gap(8),
                        Divider(color: Color.fromRGBO(237, 237, 237, 1)),
                        Gap(16),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }else if(state is GetUserError){
            return Center(child: Text(state.message));
          }
          else{
            return Center(child:Text('Error'));
          }
        },)
    );
    
  }
}
