import 'package:get/get.dart';

class IngredientQuantity {
  final String name;
  final String image;
  final RxInt qty;

  IngredientQuantity({
    required this.name,
    required this.image,
    required int qty,
  }) : qty = qty.obs;
}
