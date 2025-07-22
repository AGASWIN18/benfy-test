import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/features/recipe/data/model/recipe_model.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  final RxList<RecipeModel> allRecipes = [
    RecipeModel(
      title: 'Sunny Egg & Toast Avocado',
      creator: 'Alice Fala',
      imageUrl:
          "https://cdn.dribbble.com/userupload/44198010/file/original-bc7ff4f4e213c2b976020b07984d683f.png?resize=528x352&vertical=center",
      creatorImage: AppPngImages.profileAvator1,
      time: '20 Min',
      isFavorite: true,
    ),
    RecipeModel(
      title: 'Bowl of noodle with beef',
      creator: 'James Spader',
      imageUrl:
          "https://cdn.dribbble.com/userupload/44198502/file/original-c416f0cc402b5c9d7757ce678f2e1a38.png?resize=528x352&vertical=center",
      creatorImage: AppPngImages.profileAvator2,
      time: '15 Min',
      isFavorite: true,
    ),
    RecipeModel(
      title: 'Easy homemade beef burger',
      creator: 'Agnes',
      imageUrl:
          "https://cdn.dribbble.com/userupload/44198537/file/original-fb6ef4a44d867a060b909a6c1b5488f3.png?resize=508x336&vertical=center",
      creatorImage: AppPngImages.natalia,
      time: '20 Min',
      isFavorite: true,
    ),
    RecipeModel(
      title: 'Half boiled egg sandwich',
      creator: 'Natalia Luca',
      imageUrl:
          "https://cdn.dribbble.com/userupload/44198571/file/original-02078a4f88eaa0150e7208ad8f3ec530.png?resize=528x352&vertical=center",
      creatorImage: AppPngImages.agnes,
      isFavorite: true,
      time: '15 Min',
    ),
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44182800/file/original-d2a98363a011ebf38e73f0da5c32f26c.png?resize=512x512&vertical=center',
      title: 'Healthy Taco Salad with fresh vegetable',
      creator: 'Natalia Luca',
      kcal: '120',
      time: '20',
      isFavorite: true,
      creatorImage: AppPngImages.natalia,
    ),
    RecipeModel(
      imageUrl:
          'https://cdn.dribbble.com/userupload/44182879/file/original-fe4911313aa2988e8b64ebcee5d7f4a2.png?resize=512x512&vertical=center',
      title: 'Avocado Sandwich Delight',
      creator: 'Alice Fala',
      kcal: '95',
      time: '15',
      creatorImage: AppPngImages.profileAvator1,
      isFavorite: true,
    ),
  ].obs;

  List<RecipeModel> get favoriteRecipes =>
      allRecipes.where((recipe) => recipe.isFavorite!.value).toList();

  void toggleFavorite(RecipeModel recipe) {
    recipe.isFavorite!.toggle();
    update();
  }

  void resetFavoritesToTrue() {
    for (var recipe in allRecipes) {
      if (recipe.isFavorite != null) {
        recipe.isFavorite!.value = true;
      }
    }
    update();
  }
}
