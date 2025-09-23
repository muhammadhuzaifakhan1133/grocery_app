import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/models/category_model.dart';

class Product {
  final String image;
  final String title;
  final String price;
  final String quantity;
  final bool isAddedInCart;
  final bool isFavorite;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
    required this.isAddedInCart,
    this.isFavorite = false,
  });
}

class HomeViewModel extends ChangeNotifier {
  List<String> adBanners = [
    AppImages.adBanner1,
    AppImages.adBanner2,
    AppImages.adBanner3,
    AppImages.adBanner4,
  ];

  List<Product> featuredProducts = [
    Product(
      image: AppImages.fruit1,
      title: 'Fresh Peach',
      price: '\$8.00',
      quantity: 'dozen',
      isAddedInCart: false,
    ),
    Product(
      image: AppImages.fruit2,
      title: 'Avacoda',
      price: '\$7.00',
      quantity: '2.0 lbs',
      isAddedInCart: true,
    ),
    Product(
      image: AppImages.fruit3,
      title: 'Pineapple',
      price: '\$9.90',
      quantity: '1kg',
      isAddedInCart: false,
      isFavorite: true,
    ),
    Product(
      image: AppImages.fruit4,
      title: 'Black Grapes',
      price: '\$7.05',
      quantity: '5.0 lbs',
      isAddedInCart: false,
    ),
    Product(
      image: AppImages.fruit5,
      title: 'Pomegranate',
      price: '\$2.09',
      quantity: '1.50 lbs',
      isAddedInCart: true,
    ),
    Product(
      image: AppImages.fruit6,
      title: 'Fresh Broccoli',
      price: '\$3.00',
      quantity: '1kg',
      isAddedInCart: false,
      isFavorite: true,
    ),
  ];

  int currentAdBannerIndex = 0;

  void setCurrentAdIndex(int index) {
    currentAdBannerIndex = index;
    notifyListeners();
  }

  List<CategoryModel> categories = [
    CategoryModel(
      image: AppImages.category1,
      title: 'Vegetables',
      bgColor: const Color(0xffE6F2EA),
    ),
    CategoryModel(
      image: AppImages.category2,
      title: 'Fruits',
      bgColor: const Color(0xffFFE9E5),
    ),
    CategoryModel(
      image: AppImages.category3,
      title: 'Baverages',
      bgColor: const Color(0xffFFF6E3),
    ),
    CategoryModel(
      image: AppImages.category4,
      title: 'Grocery',
      bgColor: const Color(0xffF3EFFA),
    ),
    CategoryModel(
      image: AppImages.category5,
      title: 'Edible Oil',
      bgColor: const Color(0xffDCF4F5),
    ),
    CategoryModel(
      image: AppImages.category6,
      title: 'Household',
      bgColor: const Color(0xffFFE8F2),
    ),
    CategoryModel(
      image: AppImages.category7,
      title: 'Babycare',
      bgColor: const Color(0xffD2EFFF),
    ),
  ];
}