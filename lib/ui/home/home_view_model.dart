import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/models/category_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<String> adBanners = [
    AppImages.adBanner1,
    AppImages.adBanner2,
    AppImages.adBanner3,
    AppImages.adBanner4,
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