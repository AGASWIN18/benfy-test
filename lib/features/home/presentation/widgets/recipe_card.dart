import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class FeaturedRecipeCard extends StatelessWidget {
  final String title;
  final String creatorName;
  final String creatorImage;
  final String time;

  const FeaturedRecipeCard({
    super.key,
    required this.title,
    required this.creatorName,
    required this.creatorImage,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          decoration: BoxDecoration(color: AppColors.appSecondaryColor),
          width: ScreenUtil().screenWidth / 1.15,
          height: 130.h,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Positioned.fill(child: SvgPicture.asset(AppSvgImages.cardBgVect)),
              Positioned(
                top: 2.h,
                left: 50.w,
                child: SvgPicture.asset(AppSvgImages.cardVector1),
              ),
              Positioned(
                top: 40.h,
                left: 15.w,
                child: SvgPicture.asset(AppSvgImages.cardVector2),
              ),
              Positioned(
                top: 43.h,
                left: 90.w,
                child: SvgPicture.asset(AppSvgImages.cardVector3),
              ),
              Positioned(
                left: 8.w,
                bottom: 10.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        title,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Gap(4.w),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(1.5.r),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage(creatorImage),
                          ),
                        ),
                        Gap(6.w),
                        Text(
                          creatorName,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 8.w,
                bottom: 12.h,
                child: Row(
                  children: [
                    SvgPicture.asset(AppSvgImages.clock),
                    Gap(3.w),
                    Text(time, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
