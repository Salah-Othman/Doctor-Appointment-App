import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/auth/view/profile_view.dart';
import 'package:doctor_appointment/features/home/view/home_view.dart';
import 'package:doctor_appointment/features/home/view/home_view.dart';
import 'package:doctor_appointment/features/recommendation/view/recommendation_view.dart';
import 'package:doctor_appointment/features/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    SearchView(),
    RecommendationView(),
    ProfileView(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      /// Pages
      body: IndexedStack(index: currentIndex, children: pages),

      /// Center Search Button


      /// Bottom Navbar
      bottomNavigationBar: BottomAppBar(
        color: AppColors.backgroundColor,
        height: 55,

        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.home_outlined, 0),
              _navItem(Icons.search, 1),
              _navItem(Icons.calendar_month_outlined, 2),
              _navItem(Icons.person_outline, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: currentIndex == index ? Colors.blue : Colors.grey,
        size: 26,
      ),
      onPressed: () {
        setState(() => currentIndex = index);
      },
    );
  }
}


