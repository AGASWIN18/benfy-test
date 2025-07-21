import 'package:get/get.dart';

class RecipeModel {
  final String? title;
  final String? imageUrl;
  final String? time;
  final String? kcal;
  final String? creator;
  final String? creatorImage;
  final RxBool? isFavorite;

  RecipeModel({
    this.title,
    this.imageUrl,
    this.time,
    this.kcal,
    this.creator,
    this.creatorImage,
    bool isFavorite = false,
  }) : isFavorite = RxBool(isFavorite);
}
