import 'dart:io';

import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            if (controller.selectedIndex.value == 0) {
              exit(0);
            } else {
              controller.changeIndex(0);
            }
          }
        },
        child: Scaffold(
          body: controller.screens.elementAt(controller.selectedIndex.value),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.changeIndex(0),
            backgroundColor: AppColors.appPrimaryColor,
            shape: const CircleBorder(),
            child: SvgPicture.asset(AppSvgImages.chef, width: 25.w),
          ),

          bottomNavigationBar: Obx(
            () => ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              child: BottomAppBar(
                clipBehavior: Clip.none,
                shape: const CircularNotchedRectangle(),
                notchMargin: 8.w,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(controller.icons.length + 1, (
                      index,
                    ) {
                      if (index == 2) return Gap(40.w);
                      int iconIndex = index > 2 ? index - 1 : index;
                      return IconButton(
                        highlightColor: Colors.white,
                        onPressed: () => index == 2
                            ? null
                            : controller.changeIndex(iconIndex),
                        icon: SvgPicture.asset(
                          controller.icons[iconIndex],
                          width: 22.w,
                          color: controller.selectedIndex.value == iconIndex
                              ? const Color.fromARGB(255, 101, 227, 185)
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
