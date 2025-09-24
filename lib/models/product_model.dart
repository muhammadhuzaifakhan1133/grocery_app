import 'package:flutter/material.dart';

class ProductModel {
  final String image;
  final String title;
  final String price;
  final String availableQty;
  final bool isAddedInCart;
  final bool isFavorite;
  final int quantity;
  final Color color;
  final String description =
      "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing. Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing";

  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.availableQty,
    required this.isAddedInCart,
    this.isFavorite = false,
    this.quantity = 1,
    required this.color,
  });
}
