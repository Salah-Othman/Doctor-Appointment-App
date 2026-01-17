import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/home/view/home_view.dart';
import 'package:doctor_appointment/features/search/view/search_view.dart';
import 'package:doctor_appointment/features/user/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'features/appointment/view/appointment_view.dart';

class Root extends StatefulWidget {
  final String userName;

  const Root({super.key, required this.userName});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late String name = widget.userName;

  int currentIndex = 0;

  late final List<Widget> pages = [
    HomeView(user: widget.userName),
    SearchView(),
    AppointmentView(),
    ProfileView(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      /// Pages
      body: IndexedStack(index: currentIndex, children: pages),

      /// Bottom Navbar
      bottomNavigationBar: BottomAppBar(
        color: AppColors.backgroundColor,
        height: 80,

        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
