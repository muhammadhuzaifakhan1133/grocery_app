import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';

class FavoritesViewModel extends ChangeNotifier {
  List<ProductModel> favoriteProducts = [];

  bool isFavorite(ProductModel product) {
    return favoriteProducts.contains(product);
  }

  toggleFavorite(ProductModel product) {
    if (favoriteProducts.contains(product)) {
      removeProductFromFavorite(product);
    } else {
      addProductToFavorite(product);
    }
  }

  addProductToFavorite(ProductModel product) {
    favoriteProducts.add(product);
    notifyListeners();
  }

  removeProductFromFavorite(ProductModel product) {
    favoriteProducts.remove(product);
    notifyListeners();
  }
}
