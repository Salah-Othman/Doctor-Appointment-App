import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/home/widgets/card_widget.dart';
import 'package:doctor_appointment/features/home/widgets/home_header.dart';
import 'package:doctor_appointment/features/home/widgets/list_item_widget.dart';
import 'package:doctor_appointment/features/home/widgets/see_all.dart';
import 'package:doctor_appointment/features/home/widgets/speciality_widget.dart';
import 'package:doctor_appointment/features/recommendation/view/recommendation_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Gap(60),

            /// Header
            HomeHeader(),

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
            ListItemWidget(height: 309, itemCount: 4,),
          ],
        ),
      ),
    );
  }
}
