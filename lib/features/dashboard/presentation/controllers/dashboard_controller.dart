import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/core/config/app_text_style.dart';
import 'package:benfy/features/home/presentation/screens/home_screen.dart';
import 'package:benfy/features/profile/presentation/screens/profile_screen.dart';
import 'package:benfy/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    SizedBox(
      child: Center(
        child: Text(
          "----Notification Screen----",
          style: AppTextStyle.largeTitle,
        ),
      ),
    ),
    ProfileScreen(),
  ];

  final List<String> icons = [
    AppSvgImages.home,
    AppSvgImages.search,
    AppSvgImages.notification,
    AppSvgImages.profile,
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
