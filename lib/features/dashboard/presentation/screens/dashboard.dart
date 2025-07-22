import 'dart:io';

import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController controller = Get.put(DashboardController());

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
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              controller.screens[controller.selectedIndex.value],

              // Bottom bar with curved notch using ClipPath
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Stack(
                  children: [
                    Container(
                      height: 55.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),

                    ClipPath(
                      clipper: BottomNavClipper(),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.vertical(
                          top: Radius.circular(15.r),
                        ),
                        child: Container(
                          height: 55.h,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(5, (index) {
                              if (index == 2) {
                                return SizedBox(width: 40.w);
                              }

                              int iconIndex = index > 2 ? index - 1 : index;
                              bool isSelected =
                                  controller.selectedIndex.value == iconIndex;

                              return GestureDetector(
                                onTap: () => controller.changeIndex(iconIndex),
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  width: 70.w,
                                  height: 55.h,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    isSelected
                                        ? controller.selectedIcons[iconIndex]
                                        : controller.icons[iconIndex],
                                    width: 24.w,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // FAB
              Positioned(
                bottom: 30.h,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 60.w,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appPrimaryColor,
                    ),
                    child: IconButton(
                      onPressed: () => controller.changeIndex(0),
                      icon: SvgPicture.asset(AppSvgImages.chef, width: 26.w),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double fabRadius = 30;
    double centerX = size.width / 2;
    double notchRadius = fabRadius + 15;

    final path = Path()
      ..lineTo(centerX - notchRadius - 10, 0)
      ..quadraticBezierTo(
        centerX - notchRadius,
        0,
        centerX - notchRadius + 5,
        16,
      )
      ..arcToPoint(
        Offset(centerX + notchRadius - 5, 16),
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(
        centerX + notchRadius,
        0,
        centerX + notchRadius + 10,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
