import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/core/config/app_strings.dart';
import 'package:benfy/core/config/app_text_style.dart';
import 'package:benfy/features/home/presentation/controllers/home_screen_controller.dart';
import 'package:benfy/features/home/presentation/widgets/recipe_card.dart';
import 'package:benfy/widgets/custom_choice_chips.dart';
import 'package:benfy/widgets/custom_recipie_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10.h),
              nameRow(),
              Gap(10.h),
              featuredTitle(),
              Gap(5.h),
              featuredRecipeCarousel(),
              Gap(20.h),
              categoryTitleRow(),
              Gap(5.h),
              categoryChoices(),
              Gap(15.h),
              popularTitleRow(),
              Gap(5.h),
              popularRecipiesList(),
              Gap(50.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget popularRecipiesList() {
    return SizedBox(
      height: 210.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: controller.foodList.length,
        itemBuilder: (context, index) {
          final food = controller.foodList[index];
          final isLast = index == controller.foodList.length - 1;

          return Padding(
            padding: EdgeInsets.only(left: 12.w, right: isLast ? 12.w : 0),
            child: Obx(
              () => CustomRecipieCard(
                imageUrl: food.imageUrl,
                title: food.title,
                kcal: food.kcal,
                time: food.time,
                isFavorite: food.isFavorite.value,
                onFavoriteToggle: () => controller.toggleFavorite(index),
              ),
            ),
          );
        },
      ),
    );
  }

  CustomChoiceChips categoryChoices() {
    return CustomChoiceChips(
      choices: controller.categoryChoices,
      selectedIndex: controller.selectedCategoryIndex,
      onSelected: controller.selectCategory,
    );
  }

  Widget featuredRecipeCarousel() {
    return SizedBox(
      height: 145.h,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 145.h,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          viewportFraction: 0.75,
          padEnds: false,
          initialPage: 0,
        ),
        items: controller.recipeList.map((recipe) {
          return Builder(
            builder: (BuildContext context) {
              return FeaturedRecipeCard(
                title: recipe.title,
                creatorName: recipe.creator,
                creatorImage: recipe.creatorImage,
                time: recipe.time,
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Padding featuredTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
      child: Text(AppStrings.featured, style: AppTextStyle.sectionTitle),
    );
  }

  Padding categoryTitleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.category, style: AppTextStyle.sectionTitle),
          Text(AppStrings.seeAll, style: AppTextStyle.sectionTitleSuffix),
        ],
      ),
    );
  }

  Padding popularTitleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.popularRecipies, style: AppTextStyle.sectionTitle),
          Text(AppStrings.seeAll, style: AppTextStyle.sectionTitleSuffix),
        ],
      ),
    );
  }

  Padding nameRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.wb_sunny_outlined,
                    size: 18,
                    color: AppColors.appPrimaryColor,
                  ),
                  Gap(3),
                  Text('Good Morning', style: AppTextStyle.defaultText),
                ],
              ),
              Text('Alena Sabyan', style: AppTextStyle.largeTitle),
            ],
          ),
          IconButton(
            icon: SvgPicture.asset(AppSvgImages.cart, width: 23.w),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
