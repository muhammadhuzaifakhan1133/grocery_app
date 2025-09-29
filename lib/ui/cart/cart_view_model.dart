import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:provider/provider.dart';

class CartProduct {
  final ProductModel product;
  int quantity;

  CartProduct({required this.product, this.quantity = 1});
}

class CartViewModel extends ChangeNotifier {
  List<CartProduct> cartProducts = [];

  int getProductQuantity(ProductModel product) {
    int index = cartProducts.indexWhere((element) => element.product == product);
    if (index != -1) {
      return cartProducts[index].quantity;
    } else {
      return 0;
    }
  }

  void increaseQuantity(ProductModel product) {
    int index = cartProducts.indexWhere((element) => element.product == product);
    if (index != -1) {
      cartProducts[index].quantity++;
    } else {
      cartProducts.add(CartProduct(product: product));
    }
      notifyListeners();
  }

  void decreaseQuantity(ProductModel product) {
    int index = cartProducts.indexWhere((element) => element.product == product);
    if (index != -1) {
      if (cartProducts[index].quantity > 1) {
        cartProducts[index].quantity--;
      } else {
        cartProducts.removeAt(index);
      }
    }
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    cartProducts.removeWhere((element) => element.product == product);
    notifyListeners();
  }

  double get subTotal {
    double total = 0;
    for (var product in cartProducts) {
      total += product.product.price * product.quantity;
    }
    return total;
  }

  double shippingCharges = 10.0;

  double get totalAmount => subTotal + shippingCharges;

}