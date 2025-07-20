import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/features/home/data/models/featured_recipe_model.dart';
import 'package:benfy/features/home/data/models/popular_recipe_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final List<FeaturedRecipeModel> recipeList = [
    FeaturedRecipeModel(
      title: 'Asian white noodle with extra seafood',
      creator: 'James Spader',
      creatorImage: AppPngImages.profileAvator1,
      time: '20 Min',
    ),
    FeaturedRecipeModel(
      title: 'Healthy food with fresh veggies',
      creator: 'Olivia Smith',
      creatorImage: AppPngImages.profileAvator2,
      time: '15 Min',
    ),
  ];

  final List<PopularRecipeModel> foodList = [
    PopularRecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44168059/file/original-b071c47837f8d8ce4e622e2d7bb03261.png?resize=672x512&vertical=center',
      title: 'Healthy Taco Salad with fresh vegetable',
      kcal: '120',
      time: '20',
      isFavorite: false,
    ),
    PopularRecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44169582/file/original-a2b2d6604f2bbb3b0ccba7419027eb35.png?resize=476x512&vertical=center',
      title: 'Avocado Sandwich Delight',
      kcal: '95',
      time: '15',
      isFavorite: false,
    ),
  ];

  final List<String> categoryChoices = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Trending',
    'Desserts',
  ];
  var selectedCategoryIndex = 0.obs;

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void toggleFavorite(int index) {
    foodList[index].isFavorite.toggle();
  }
}
