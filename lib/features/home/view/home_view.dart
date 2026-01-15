import 'package:doctor_appointment/features/home/data/logic/home_cubit.dart';
import 'package:doctor_appointment/features/home/view/speciality_view.dart';
import 'package:doctor_appointment/features/home/widgets/card_widget.dart';
import 'package:doctor_appointment/features/home/widgets/home_header.dart';
import 'package:doctor_appointment/features/home/widgets/see_all.dart';
import 'package:doctor_appointment/features/recommendation/view/recommendation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/list_item_widget.dart';
import '../widgets/speciality_widget.dart';
import 'notification.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});
final String user;
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
              HomeHeader(text: 'Hi, $user!',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationView()));
              },
              ),

              /// Card
              CardWidget(),
              Gap(24),

              /// Speciality
              SeeAll(text: 'Doctor Speciality', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialityView()));
              }),
              Gap(16),
              SpecialityWidget(),
              Gap(23),

              /// List Item
              SeeAll(text: 'Recommendation Doctor', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecommendationView()));

              }),
              ListItemWidget(height: 220),
            ],
          ),
        ),
      ),
    );
  }
}
