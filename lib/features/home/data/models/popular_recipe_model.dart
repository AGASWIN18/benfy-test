import 'package:get/get.dart';

class PopularRecipeModel {
  final String imageUrl;
  final String title;
  final String kcal;
  final String time;
  final RxBool isFavorite;

  PopularRecipeModel({
    required this.imageUrl,
    required this.title,
    required this.kcal,
    required this.time,
    required bool isFavorite,
  }) : isFavorite = RxBool(isFavorite);
}
