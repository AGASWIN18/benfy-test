import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/core/config/app_text_style.dart';
import 'package:benfy/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRecipieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String kcal;
  final String time;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const CustomRecipieCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.kcal,
    required this.time,
    this.isFavorite = false,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185.w,
      // margin: EdgeInsets.all(12.r),
      padding: EdgeInsets.all(13.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(26, 0, 0, 0),
            blurRadius: 15,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: 110.h,
                  borderRadius: 16.r,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: InkWell(
                  onTap: onFavoriteToggle,
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: isFavorite
                        ? SvgPicture.asset(AppSvgImages.heartBlue, width: 18.w)
                        : SvgPicture.asset(AppSvgImages.heart, width: 18.w),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.cardTitle,
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              SvgPicture.asset(AppSvgImages.calories),
              SizedBox(width: 3.w),
              Text('$kcal Kcal', style: AppTextStyle.cardAddOns),
              Spacer(),
              SvgPicture.asset(AppSvgImages.separator),
              Spacer(),
              SvgPicture.asset(
                AppSvgImages.clock,
                colorFilter: ColorFilter.mode(
                  AppColors.appGreyTextColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 3.w),
              Text('$time Min', style: AppTextStyle.cardAddOns),
            ],
          ),
        ],
      ),
    );
  }
}
