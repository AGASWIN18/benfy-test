import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/core/config/app_routes.dart';
import 'package:benfy/core/config/app_strings.dart';
import 'package:benfy/core/config/app_text_style.dart';
import 'package:benfy/features/recipe/data/model/recipe_model.dart';
import 'package:benfy/features/recipe/presentation/controllers/recipe_details_controller.dart';
import 'package:benfy/features/recipe/presentation/widgets/custom_recipie_card.dart';
import 'package:benfy/features/recipe/presentation/widgets/ingredients_card.dart';
import 'package:benfy/widgets/custom_button.dart';
import 'package:benfy/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipeModel recipeModel;

  const RecipeDetailScreen({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///recipe image
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: CustomCachedImage(
              imageUrl: recipeModel.imageUrl ?? '',
              fit: BoxFit.cover,
            ),
          ),

          /// close
          Positioned(
            top: 50.h,
            left: 16.w,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(26, 0, 0, 0),
                      blurRadius: 15,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: SvgPicture.asset(AppSvgImages.close),
              ),
            ),
          ),

          ///favorite
          Positioned(
            top: 50.h,
            right: 16.w,
            child: GestureDetector(
              onTap: () => Get.find<RecipeDetailsController>().toggleFavorite(
                recipeModel,
              ),
              child: Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(26, 0, 0, 0),
                      blurRadius: 15,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Obx(
                  () => SvgPicture.asset(
                    recipeModel.isFavorite!.value == true
                        ? AppSvgImages.heartBlue
                        : AppSvgImages.heart,
                    width: 23.w,
                  ),
                ),
              ),
            ),
          ),

          ///recipe detail sheet
          DraggableScrollableSheet(
            initialChildSize: 0.62,
            minChildSize: 0.62,
            maxChildSize: 0.85,
            snap: true,
            builder: (context, scrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: _BottomSheetContent(recipeModel: recipeModel),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  final RecipeModel recipeModel;
  _BottomSheetContent({required this.recipeModel});

  final RecipeDetailsController controller = Get.put(RecipeDetailsController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Center(
            child: Container(
              width: 80.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          //recipe title
          recipeTitleRow(),
          SizedBox(height: 10.h),
          // Description
          recipeDescription(),
          SizedBox(height: 20.h),
          // Nutrition Cards
          nutritionSection(recipeModel),
          SizedBox(height: 28.h),
          // ingredients/instruction tab Bar
          ingredientsTabBarSection(),
          SizedBox(height: 20.h),
          // TabBarView
          Obx(() {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: controller.tabIndex.value == 0
                  ? _ingredientsTab()
                  : _instructionsTab(),
            );
          }),
          Gap(10.h),
          addToCartButton(),
          _divider(),
          creatorSection(),
          Gap(20.h),
          relatedRecipeSection(),
          Gap(20.h),
        ],
      ),
    );
  }

  Divider _divider() {
    return Divider(
      endIndent: 20,
      indent: 20,
      color: AppColors.bgGreyColor,
      thickness: 1.h,
      height: 50.h,
    );
  }

  Column creatorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.w),
          child: Text(AppStrings.creator, style: AppTextStyle.sectionTitle),
        ),
        ListTile(
          leading: Container(
            padding: EdgeInsets.all(1.5.r),
            decoration: BoxDecoration(
              color: AppColors.appSecondaryColor,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage(AppPngImages.profileAvator2),
            ),
          ),
          title: Text(
            "Natalia Luca",
            style: TextStyle(
              color: AppColors.appTextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            "I'm the author and recipe developer.",
            style: AppTextStyle.defaultText,
          ),
        ),
      ],
    );
  }

  Padding addToCartButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.r),
      child: CustomButton(
        onTap: () {},
        title: AppStrings.addToCart,
        color: AppColors.appSecondaryColor,
      ),
    );
  }

  Padding ingredientsTabBarSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Container(
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          color: AppColors.bgGreyColor,
          borderRadius: BorderRadius.circular(17.r),
        ),
        child: TabBar(
          onTap: controller.changeTab,
          dividerColor: Colors.transparent,
          padding: EdgeInsets.all(5.r),
          automaticIndicatorColorAdjustment: true,
          indicator: BoxDecoration(
            color: AppColors.appPrimaryColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
          indicatorWeight: 1,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.appPrimaryColor,
          unselectedLabelStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
          labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
          tabs: [
            Tab(text: AppStrings.ingredients),
            Tab(text: AppStrings.instructions),
          ],
        ),
      ),
    );
  }

  Padding recipeDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: ReadMoreText(
        // recipeModel.title ?? 'Delicious meal',
        "This Healthy Taco Salad is the universal delight of taco night, This Healthy Taco Salad is the universal delight of taco night",
        trimLength: 70,
        trimMode: TrimMode.Length,
        trimCollapsedText: AppStrings.viewMore,
        trimExpandedText: " ${AppStrings.viewLess}",
        colorClickableText: AppColors.appPrimaryColor,
        style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade600),
        moreStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.appPrimaryColor,
        ),
        lessStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.appPrimaryColor,
        ),
      ),
    );
  }

  Padding recipeTitleRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              recipeModel.title ?? 'Untitled',
              style: AppTextStyle.largeTitle,
            ),
          ),
          SizedBox(width: 4.w),
          SvgPicture.asset(
            AppSvgImages.clock,
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            width: 20.w,
          ),
          SizedBox(width: 4.w),
          Text('${recipeModel.time ?? '--'} Min'),
        ],
      ),
    );
  }

  Widget nutritionSection(RecipeModel recipeModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: nutritionTile(AppSvgImages.carbs, "65g", "Carbs"),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: nutritionTile(AppSvgImages.protiens, "27g", "Proteins"),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: nutritionTile(
                  AppSvgImages.kcal,
                  recipeModel.kcal ?? '--',
                  "Kcal",
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(child: nutritionTile(AppSvgImages.fats, "91g", "Fats")),
            ],
          ),
        ],
      ),
    );
  }

  Widget nutritionTile(String icon, String value, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.bgGreyColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SvgPicture.asset(icon),
        ),
        Gap(14.w),
        Text("$value $label", style: AppTextStyle.mediumText),
      ],
    );
  }

  Widget _ingredientsTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ingredientsTitle(),
          Gap(10.h),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            clipBehavior: Clip.none,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = controller.ingredients[index];
              return Obx(
                () => IngredientCard(
                  imagePath: ingredient.image,
                  name: ingredient.name,
                  quantity: ingredient.qty.value,
                  onIncrement: () => controller.incrementQty(index),
                  onDecrement: () => controller.decrementQty(index),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Column ingredientsTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.ingredients, style: AppTextStyle.sectionTitle),
            Text(AppStrings.addAllCart, style: AppTextStyle.sectionTitleSuffix),
          ],
        ),
        Text(
          "${controller.ingredients.length} Item",
          style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget relatedRecipeSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.relatedRecipies,
                style: AppTextStyle.sectionTitle,
              ),
              Text(AppStrings.seeAll, style: AppTextStyle.sectionTitleSuffix),
            ],
          ),
          Gap(10.h),
          SizedBox(
            height: 110.h,
            child: Row(
              spacing: 14.w,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(controller.relatedRecipeList.length, (
                index,
              ) {
                final recipe = controller.relatedRecipeList[index];
                return Expanded(
                  child: CustomRecipeCard(
                    onTap: () =>
                        Get.toNamed(AppRoutes.recipeDetail, arguments: recipe),
                    recipeModel: recipe,
                    isSmall: true,
                    isEditorChoice: false,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _instructionsTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.instructions, style: AppTextStyle.sectionTitle),
          Gap(10.h),
          Text(
            "1. Chop the vegetables\n2. Cook for 10 mins\n3. Add seasoning and serve hot.",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
          ),
          Gap(10.h),
        ],
      ),
    );
  }
}
