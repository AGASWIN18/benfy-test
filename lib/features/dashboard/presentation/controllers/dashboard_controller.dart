import 'package:benfy/features/home/presentation/screens/home_screen.dart';
import 'package:benfy/features/profile/presentation/screens/profile_screen.dart';
import 'package:benfy/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    SizedBox(),
    ProfileScreen(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
