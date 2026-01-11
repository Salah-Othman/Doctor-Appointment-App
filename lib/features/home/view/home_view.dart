import 'package:doctor_appointment/features/home/data/logic/home_cubit.dart';
import 'package:doctor_appointment/features/home/view/speciality_view.dart';
import 'package:doctor_appointment/features/home/widgets/list_item_widget.dart';
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
              SeeAll(text: 'Doctor Speciality', onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => SpecialityView()),
                );
              }),
              Gap(16),
              SpecialityWidget(),
              Gap(23),

              /// Recommendation Doctor
              SeeAll(
                text: 'Recommendation Doctor',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => RecommendationView(
                    )),
                  );
                },
              ),

              /// List

             ListItemWidget(height: 215),
            ],
          ),
        ),
      ),
    );
  }
}
