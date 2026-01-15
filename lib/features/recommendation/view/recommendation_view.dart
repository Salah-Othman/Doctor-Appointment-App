import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:doctor_appointment/features/home/widgets/list_item_widget.dart';
import 'package:doctor_appointment/shared/container_btn.dart';
import 'package:doctor_appointment/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class RecommendationView extends StatelessWidget {
  const RecommendationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title:CustomText(
          text: 'Recommendation Doctor',
          color: AppColors.primaryText,
          size: 18,
          weight: FontWeight.w600,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: ContainerBtn(
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
            ),
          ),
        ),
        actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ContainerBtn(
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                  ),
                ),
                ),
        ),
              ]
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(32),

              /// Search & filter
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    width: 290,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: Icon(
                            Icons.search,
                            color: Color.fromRGBO(194, 194, 194, 1),
                          ),
                        ),
                        Gap(8),
                        Center(
                          child: CustomText(
                            text: 'Search',
                            color: Color.fromRGBO(194, 194, 194, 1),
                            size: 12,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(12),
                  Icon(Icons.menu),
                ],
              ),
              Gap(24),

              /// List
              ListItemWidget(height: 600),
            ],
          ),
        ),
      ),
    );
  }
}
