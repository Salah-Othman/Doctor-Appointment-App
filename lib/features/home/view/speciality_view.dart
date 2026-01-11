import 'package:doctor_appointment/shared/container_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/circle_widget.dart';
import '../../../shared/custom_text.dart';
import '../data/logic/home_cubit.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSpeciality(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Gap(50),
              Row(
                children: [
                  ContainerBtn(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Gap(70),
                  Center(
                    child: CustomText(
                      text: 'Doctor Speciality',
                      color: AppColors.primaryText,
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(20),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is SpecialityLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SpecialityLoaded) {
                    final specialization = state.speciality.data;
                    return SizedBox(
                      height: 600,
                      child: GridView.builder(
                        itemCount: specialization.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          final speciality = specialization[index];
                          return Container(
                            width: 80,
                            height: 117,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                            ),
                            child: Column(
                              children: [
                                CircleWidget(
                                  width: 80,
                                  height: 80,
                                  color: Color.fromRGBO(244, 248, 255, 1),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/speciality/General.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ),
                                Gap(12),
                                CustomText(
                                  text: speciality.name.toString(),
                                  size: 12,
                                  weight: FontWeight.w400,
                                  color: AppColors.primaryText,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is SpecialityError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Center(child: Text('Error'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
