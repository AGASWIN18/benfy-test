import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/features/recipe/data/model/recipe_model.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  final List<RecipeModel> popularRecipeList = [
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44182858/file/original-10b492a94b24dd7dc045ebf6c17ccb70.png?resize=512x512&vertical=center',
      title: 'Healthy Taco Salad with fresh vegetable',
      kcal: '120',
      time: '20',
      isFavorite: false,
    ),
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44182879/file/original-fe4911313aa2988e8b64ebcee5d7f4a2.png?resize=512x512&vertical=center',
      title: 'Avocado Sandwich Delight',
      kcal: '95',
      time: '15',
      isFavorite: false,
    ),
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44182800/file/original-d2a98363a011ebf38e73f0da5c32f26c.png?resize=512x512&vertical=center',
      title: 'Healthy Taco Salad with fresh vegetable',
      kcal: '120',
      time: '20',
      isFavorite: false,
    ),
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44169582/file/original-a2b2d6604f2bbb3b0ccba7419027eb35.png?resize=476x512&vertical=center',
      title: 'Avocado Sandwich Delight',
      kcal: '95',
      time: '15',
      isFavorite: false,
    ),
  ];
  final List<RecipeModel> editorsChoiceList = [
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44186428/file/original-585b53d5d0ed73df07201a650c36abef.png?resize=400x336&vertical=center',
      title: 'Easy homemade beef burger',
      kcal: '120',
      time: '20',
      creatorImage: AppPngImages.profileAvator1,
      creator: "James Spader",
      isFavorite: false,
    ),
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44186438/file/original-23c812fe642a22303b063bb825295440.png?resize=400x336&vertical=center',
      title: 'Blueberry with egg for breakfast',
      kcal: '95',
      time: '15',
      creator: "Alice Fala",
      creatorImage: AppPngImages.profileAvator2,
      isFavorite: false,
    ),
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44182800/file/original-d2a98363a011ebf38e73f0da5c32f26c.png?resize=512x512&vertical=center',
      title: 'Toast with egg for breakfast',
      kcal: '120',
      time: '20',
      creator: "James Spader",
      creatorImage: AppPngImages.profileAvator1,
      isFavorite: false,
    ),
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44169582/file/original-a2b2d6604f2bbb3b0ccba7419027eb35.png?resize=476x512&vertical=center',
      title: 'Avocado Sandwich Delight',
      kcal: '95',
      time: '15',
      creator: "Alice Fala",
      creatorImage: AppPngImages.profileAvator2,
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
}
