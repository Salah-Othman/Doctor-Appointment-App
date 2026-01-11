import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/shared/circle_widget.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../data/logic/home_cubit.dart';

class SpecialityWidget extends StatelessWidget {
 const SpecialityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getSpeciality(),
      child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if(state is SpecialityLoading){
              return Center(child: CircularProgressIndicator());
            }
            else if(state is SpecialityLoaded){
             final  specialization = state.speciality.data;
              return SizedBox(
                height: 86,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => Gap(16),
                  itemCount:specialization.take(4).length,
                  itemBuilder: (context, index) {
                    final speciality = specialization[index];
                    return Container(
                      width: 73,
                      height: 86,
                      decoration: BoxDecoration(color: AppColors.backgroundColor),
                      child: Column(
                        children: [
                          CircleWidget(
                            width: 56,
                            height: 56,
                            color: Color.fromRGBO(244, 248, 255, 1),
                            child: Center(
                              child:
                              Image.asset('assets/speciality/General.png', width: 24, height: 24),
                            ),
                          ),
                          Gap(8),
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
            }else if(state is SpecialityError){
              return Center(child: Text(state.message));
            }else {
              return Center(child: Text('Error'));
            }
          },
      )
    );
  }
}
