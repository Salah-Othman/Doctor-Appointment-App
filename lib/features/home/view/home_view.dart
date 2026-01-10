import 'package:doctor_appointment/features/home/data/logic/home_cubit.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../recommendation/view/recommendation_view.dart';
import '../widgets/card_widget.dart';
import '../widgets/home_header.dart';
import '../widgets/see_all.dart';
import '../widgets/speciality_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDoctor(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Gap(50),

              /// Header
              HomeHeader(text: 'Hi, Khaled!'),

              /// Card
              CardWidget(),
              Gap(24),

              /// Doctor Speciality
              SeeAll(text: 'Doctor Speciality', onTap: () {}),
              Gap(16),
              SpecialityWidget(),
              Gap(23),

              /// Recommendation Doctor
              SeeAll(
                text: 'Recommendation Doctor',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => RecommendationView()),
                  );
                },
              ),

              /// List
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if(state is HomeLoading){
                    return Center(child: CircularProgressIndicator());
                  }
                else if(state is HomeLoaded){
                  final data = state.home.data;
                  return SizedBox(
                    height: 215,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: state.home.data.length,
                      itemBuilder: (context, dataIndex) {
                        final data =
                        state.home.data[dataIndex];

                        return ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.doctors.length,
                          itemBuilder: (context, doctorIndex) {
                            final doctor = data.doctors[doctorIndex];
                            return Container(
                              padding: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width,
                              height: 126,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.network(
                                      doctor.photo,
                                      width: 110,
                                      height: 110,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return  Image.asset('assets/home/doctor.png');
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          overFlow: TextOverflow.ellipsis,
                                          maxline: 1,
                                          text: doctor.name,
                                          color: AppColors.primaryText,
                                          size: 16,
                                          weight: FontWeight.w700,
                                        ),
                                        Gap(6),
                                        Row(
                                          children: [
                                            CustomText(
                                              text:doctor.degree,
                                              weight: FontWeight.w500,
                                              size: 12,
                                              color: AppColors.secondryColor,
                                            ),
                                            Gap(8),
                                            CustomText(
                                              text: '|',
                                              weight: FontWeight.w500,
                                              size: 12,
                                              color: AppColors.secondryColor,
                                            ),
                                            Gap(8),
                                            CustomText(
                                              overFlow: TextOverflow.ellipsis,
                                              maxline: 1,
                                              text: doctor.degree,
                                              weight: FontWeight.w500,
                                              size: 12,
                                              color: AppColors.secondryColor,
                                            ),
                                          ],
                                        ),
                                        Gap(6),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(255, 214, 0, 1),
                                              size: 16,
                                            ),
                                            Gap(4),
                                            CustomText(
                                              text: '4.8',
                                              weight: FontWeight.w500,
                                              size: 12,
                                              color: AppColors.secondryColor,
                                            ),
                                            Gap(4),
                                            CustomText(
                                              text: '(4,279 reviews)',
                                              weight: FontWeight.w500,
                                              size: 12,
                                              color: AppColors.secondryColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                  }
                else {
                  return Center(child: Text('Error'));
                }
              },)
            ],
          ),
        ),
      ),
    );
  }
}
