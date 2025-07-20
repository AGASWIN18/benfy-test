import 'dart:io';

import 'package:benfy/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomChoiceChips extends StatelessWidget {
  final List<String> choices;
  final RxInt selectedIndex;
  final Function(int) onSelected;

  const CustomChoiceChips({
    super.key,
    required this.choices,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: choices.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = selectedIndex.value == index;
            return ChoiceChip(
              label: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                child: Text(
                  choices[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.appTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              selected: isSelected,
              showCheckmark: false,
              selectedColor: AppColors.appSecondaryColor,
              backgroundColor: AppColors.appCChipBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide(color: Colors.transparent),
              ),
              onSelected: (_) => onSelected(index),
            );
          });
        },
      ),
    );
  }
}
