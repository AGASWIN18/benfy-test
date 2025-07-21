import 'package:benfy/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static final TextStyle defaultText = TextStyle(
    fontSize: 14.sp,
    color: AppColors.appTextColor,
  );
  static final TextStyle largeTitle = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.appTextColor,
  );
  static final TextStyle sectionTitle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.appTextColor,
  );
  static final TextStyle sectionTitleSuffix = TextStyle(
    color: AppColors.appSecondaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w800,
  );
  static final TextStyle cardTitle = TextStyle(
    color: AppColors.appTextColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle cardTitleRegular = TextStyle(
    color: AppColors.appTextColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle cardAddOns = TextStyle(
    color: AppColors.appGreyTextColor,
    fontSize: 14.sp,
  );
}
