import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/core/config/app_text_style.dart';
import 'package:benfy/features/recipe/data/model/recipe_model.dart';
import 'package:benfy/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomRecipeCard extends StatelessWidget {
  final RecipeModel recipeModel;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onTap;
  final bool isSmall;
  final bool isEditorChoice;

  const CustomRecipeCard({
    super.key,
    this.onFavoriteToggle,
    this.onTap,
    required this.isSmall,
    required this.isEditorChoice,
    required this.recipeModel,
  });

  @override
  Widget build(BuildContext context) {
    return isEditorChoice ? _buildEditorChoiceCard() : _buildNormalRecipeCard();
  }

  Widget _buildEditorChoiceCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(26, 0, 0, 0),
            blurRadius: 15,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CustomCachedImage(
              imageUrl: recipeModel.imageUrl ?? '',
              width: 90.w,
              height: 90.w,
              borderRadius: 16.r,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipeModel.title ?? 'Untitled',
                  style: AppTextStyle.cardTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1.5.r),
                      decoration: BoxDecoration(
                        color: AppColors.appSecondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 10.r,
                        backgroundImage: AssetImage(
                          recipeModel.creatorImage?.isNotEmpty == true
                              ? recipeModel.creatorImage!
                              : AppPngImages.imagePLaceHolder,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      recipeModel.creator ?? 'Unknown',
                      style: AppTextStyle.cardAddOns,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.r),
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: AppColors.appPrimaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 20.w),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNormalRecipeCard() {
    return InkWell(
      onTap: isSmall ? null : onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: isSmall ? 100.w : 185.w,
        padding: isSmall ? EdgeInsets.all(8.r) : EdgeInsets.all(13.r),
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
                    imageUrl: recipeModel.imageUrl ?? '',
                    width: double.infinity,
                    height: isSmall ? 70.h : 110.h,
                    borderRadius: 16.r,
                    fit: BoxFit.cover,
                  ),
                ),
                if (!isSmall)
                  Obx(
                    () => Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: InkWell(
                        onTap: onFavoriteToggle,
                        child: Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: recipeModel.isFavorite?.value == true
                              ? SvgPicture.asset(
                                  AppSvgImages.heartBlue,
                                  width: 18.w,
                                )
                              : SvgPicture.asset(
                                  AppSvgImages.heart,
                                  width: 18.w,
                                ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: isSmall ? 5.h : 12.h),
            Text(
              recipeModel.title ?? 'Untitled',
              maxLines: isSmall ? 1 : 2,
              overflow: TextOverflow.ellipsis,
              style: isSmall
                  ? AppTextStyle.cardTitleRegular
                  : AppTextStyle.cardTitle,
            ),
            if (!isSmall)
              Column(
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      SvgPicture.asset(AppSvgImages.calories),
                      SizedBox(width: 3.w),
                      Text(
                        '${recipeModel.kcal ?? '--'} Kcal',
                        style: AppTextStyle.cardAddOns,
                      ),
                      SizedBox(width: 6.w),
                      SvgPicture.asset(AppSvgImages.separator),
                      SizedBox(width: 6.w),
                      SvgPicture.asset(
                        AppSvgImages.clock,
                        colorFilter: ColorFilter.mode(
                          AppColors.appGreyTextColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '${recipeModel.time ?? '--'} Min',
                        style: AppTextStyle.cardAddOns,
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
