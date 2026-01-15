import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/appointment/widgets/completed_list.dart';
import 'package:doctor_appointment/features/appointment/widgets/upcomming_list.dart';
import 'package:flutter/material.dart';
import '../../../shared/container_btn.dart';
import '../../../shared/custom_text.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.index = 0;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ContainerBtn(
                  child: Center(child: Icon(Icons.arrow_back_ios_new)),
                ),
              ),
              CustomText(
                text: 'My Appointment',
                color: AppColors.primaryText,
                size: 18,
                weight: FontWeight.w600,
              ),
              ContainerBtn(
                child: Center(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ),
              ),
            ],
          ),
        ),

        bottom: TabBar(
          padding: EdgeInsetsGeometry.only(left: 16, right: 16),
          dividerColor: Color.fromRGBO(158, 158, 158, 1),
          dividerHeight: 2,
          unselectedLabelColor: Color.fromRGBO(158, 158, 158, 1),
          labelColor: AppColors.primaryColor,
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          indicatorColor: AppColors.primaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,
          controller: tabController,
          tabs: [
            Tab(child: CustomText(text: 'Upcoming')),
            Tab(child: CustomText(text: 'Completed')),
            Tab(child: CustomText(text: 'Cancelled')),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: UpcommingList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CompletedList(
              text: 'Appointment done',
              color: Color.fromRGBO(34, 197, 94, 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CompletedList(
              text: 'Appointment cancelled',
              color: Color.fromRGBO(255, 76, 94, 1),
            ),
          ),
        ],
      ),
    );
  }
}
