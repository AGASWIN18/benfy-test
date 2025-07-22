import 'package:benfy/core/config/app_images.dart';
import 'package:benfy/features/recipe/data/model/ingredients_model.dart';
import 'package:benfy/features/recipe/data/model/recipe_model.dart';
import 'package:get/get.dart';

class RecipeDetailsController extends GetxController {
  var tabIndex = 0.obs;

  final ingredients = <IngredientQuantity>[
    IngredientQuantity(
      name: "Tortilla Chips",
      image: AppPngImages.chips,
      qty: 1,
    ),
    IngredientQuantity(name: "Avocado", image: AppPngImages.avacado, qty: 1),
    IngredientQuantity(
      name: "Red Cabbage",
      image: AppPngImages.cabbage,
      qty: 1,
    ),
    IngredientQuantity(name: "Peanuts", image: AppPngImages.peanut, qty: 1),
    IngredientQuantity(name: "Red Onions", image: AppPngImages.onion, qty: 1),
  ].obs;

  final List<RecipeModel> relatedRecipeList = [
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
  ];

  void incrementQty(int index) => ingredients[index].qty.value++;
  void decrementQty(int index) {
    if (ingredients[index].qty.value > 1) {
      ingredients[index].qty.value--;
    }
  }

  void changeTab(int index) => tabIndex.value = index;

  void toggleFavorite(RecipeModel recipe) {
    recipe.isFavorite!.toggle();
  }
}
