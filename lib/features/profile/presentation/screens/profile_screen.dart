import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/core/config/app_routes.dart';
import 'package:benfy/core/config/app_strings.dart';
import 'package:benfy/core/config/app_text_style.dart';
import 'package:benfy/features/profile/presentation/controllers/profile_screen_controller.dart';
import 'package:benfy/features/recipe/data/model/recipe_model.dart';
import 'package:benfy/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileScreenController controller = Get.put(ProfileScreenController());

  @override
  void dispose() {
    controller.resetFavoritesToTrue();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 20,
        title: Text(AppStrings.account, style: AppTextStyle.largeTitle),
        actions: [SvgPicture.asset(AppSvgImages.settings, width: 25.w)],
        actionsPadding: EdgeInsets.only(right: 15.r),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(5.h),
            profileCard(),
            Gap(15.h),
            favoriteTitleRow(),
            buildFavoritesGrid(),
            Gap(80.h),
          ],
        ),
      ),
    );
  }

  Widget profileCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
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
            child: Container(
              padding: EdgeInsets.all(1.5.r),
              decoration: BoxDecoration(
                color: AppColors.appSecondaryColor,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 25.r,
                backgroundImage: AssetImage(AppPngImages.profileAvator2),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alena Sabyan",
                  maxLines: 1,
                  style: AppTextStyle.cardTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text("Recipe Developer", style: AppTextStyle.defaultText),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.r),
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: AppColors.appPrimaryColor,
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 20.w),
            ),
          ),
        ],
      ),
    );
  }

  Padding favoriteTitleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.myFavorites, style: AppTextStyle.sectionTitle),
          Text(AppStrings.seeAll, style: AppTextStyle.sectionTitleSuffix),
        ],
      ),
    );
  }

  Widget buildFavoritesGrid() {
    return GetBuilder<ProfileScreenController>(
      init: ProfileScreenController(),
      builder: (controller) {
        final favoriteRecipes = controller.favoriteRecipes;
        return GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: favoriteRecipes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final recipe = favoriteRecipes[index];
            return _buildNormalRecipeCard(recipe);
          },
        );
      },
    );
  }

  Widget _buildNormalRecipeCard(RecipeModel recipe) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.recipeDetail, arguments: recipe),
      child: Container(
        width: 175.w,
        padding: EdgeInsets.only(top: 12.r, right: 12.r, left: 12.r),
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
                    imageUrl: recipe.imageUrl ?? '',
                    width: double.infinity,
                    height: 80.h,
                    borderRadius: 16.r,
                    fit: BoxFit.cover,
                  ),
                ),
                Obx(
                  () => Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: InkWell(
                      onTap: () => controller.toggleFavorite(recipe),
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9.r),
                        ),
                        child: recipe.isFavorite?.value == true
                            ? SvgPicture.asset(
                                AppSvgImages.heartBlue,
                                width: 18.w,
                              )
                            : SvgPicture.asset(AppSvgImages.heart, width: 18.w),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              recipe.title ?? 'Untitled',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.cardTitle,
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(1.5.r),
                  decoration: BoxDecoration(
                    color: AppColors.appSecondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 12.r,
                    backgroundImage: AssetImage(
                      recipe.creatorImage ?? AppPngImages.imagePLaceHolder,
                    ),
                  ),
                ),
                Gap(6.w),
                Text(
                  recipe.creator ?? AppStrings.creator,
                  style: AppTextStyle.cardAddOns,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
