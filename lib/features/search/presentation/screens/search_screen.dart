import 'package:benfy/core/config/app_colors.dart';
import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/core/config/app_strings.dart';
import 'package:benfy/core/config/app_text_style.dart';
import 'package:benfy/features/search/presentation/controllers/search_screen_controller.dart';
import 'package:benfy/widgets/custom_choice_chips.dart';
import 'package:benfy/features/recipe/presentation/widgets/custom_recipie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchScreenController controller = Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ///fixed con=tent
            headerSection(),
            categoryChoices(),

            /// scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10.h),
                    popularRecipesTitle(),
                    Gap(12.h),
                    popularRecipiesList(),
                    Gap(12.h),
                    editorChoiceTitle(),
                    Gap(12.h),
                    editorsChoiceList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget popularRecipiesList() {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: controller.popularRecipeList.length,
        itemBuilder: (context, index) {
          final recipe = controller.popularRecipeList[index];
          final isLast = index == controller.popularRecipeList.length - 1;

          return Padding(
            padding: EdgeInsets.only(left: 14.w, right: isLast ? 14.w : 0),
            child: CustomRecipeCard(
              recipeModel: recipe,
              isSmall: true,
              isEditorChoice: false,
            ),
          );
        },
      ),
    );
  }

  Widget editorsChoiceList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.editorsChoiceList.length,
        itemBuilder: (context, index) {
          final recipe = controller.editorsChoiceList[index];

          return CustomRecipeCard(
            recipeModel: recipe,
            isSmall: true,
            isEditorChoice: true,
          );
        },
      ),
    );
  }

  Container headerSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [pageTitle(), Gap(5.h), recipeSearchField()],
      ),
    );
  }

  Padding popularRecipesTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.popularRecipies, style: AppTextStyle.sectionTitle),
          Text(AppStrings.viewAll, style: AppTextStyle.sectionTitleSuffix),
        ],
      ),
    );
  }

  Padding editorChoiceTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.editorChoice, style: AppTextStyle.sectionTitle),
          Text(AppStrings.viewAll, style: AppTextStyle.sectionTitleSuffix),
        ],
      ),
    );
  }

  Row pageTitle() {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios, size: 18),
        Gap(100.w),
        Text(AppStrings.search, style: AppTextStyle.largeTitle),
      ],
    );
  }

  Widget categoryChoices() {
    return CustomChoiceChips(
      choices: controller.categoryChoices,
      selectedIndex: controller.selectedCategoryIndex,
      onSelected: controller.selectCategory,
    );
  }

  TextField recipeSearchField() {
    return TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: AppTextStyle.cardAddOns,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10.0).r,
          child: SvgPicture.asset(AppSvgImages.search),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.appGreyTextColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(width: 2.w, color: Colors.grey[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(width: 2.w, color: Colors.grey[200]!),
        ),
      ),
    );
  }
}
