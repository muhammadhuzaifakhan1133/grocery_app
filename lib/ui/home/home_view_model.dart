import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/routes/routes.dart';


class HomeViewModel extends ChangeNotifier {

  HomeViewModel() {
    startAutoScrollAdTimer();
  }

  PageController pageController = PageController();

  Timer? autoScrollAdTimer;

  bool showMore = false;

  void toggleShowMore() {
    showMore = !showMore;
    notifyListeners();
  }

  void startAutoScrollAdTimer() {
    autoScrollAdTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentAdBannerIndex < adBanners.length - 1) {
        currentAdBannerIndex++;
      } else {
        currentAdBannerIndex = 0;
      }
      pageController.animateToPage(
        currentAdBannerIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      notifyListeners();
    });
  }

  void stopAutoScrollAdTimer() {
    autoScrollAdTimer?.cancel();
  }

  void navigateToReviewsView(BuildContext context) {
    context.push(AppRoutes.reviews);
  }

  @override
  void dispose() {
    pageController.dispose();
    stopAutoScrollAdTimer();
    super.dispose();
  }

  List<String> adBanners = [
    AppImages.adBanner1,
    AppImages.adBanner2,
    AppImages.adBanner3,
    AppImages.adBanner4,
  ];

  List<ProductModel> featuredProducts = [
    ProductModel(
      image: AppImages.fruit1,
      title: 'Fresh Peach',
      price: '\$8.00',
      availableQty: 'dozen',
      isAddedInCart: false,
      color: const Color(0xffFFCEC1),
    ),
    ProductModel(
      image: AppImages.fruit2,
      title: 'Avacoda',
      price: '\$7.00',
      availableQty: '2.0 lbs',
      isAddedInCart: true,
      color: const Color(0xffFCFFD9),
    ),
    ProductModel(
      image: AppImages.fruit3,
      title: 'Pineapple',
      price: '\$9.90',
      availableQty: '1kg',
      isAddedInCart: false,
      isFavorite: true,
      color: const Color(0xffFFE6C2),
    ),
    ProductModel(
      image: AppImages.fruit4,
      title: 'Black Grapes',
      price: '\$7.05',
      availableQty: '5.0 lbs',
      isAddedInCart: false,
      color: const Color(0xffFEE1ED),
    ),
    ProductModel(
      image: AppImages.fruit5,
      title: 'Pomegranate',
      price: '\$2.09',
      availableQty: '1.50 lbs',
      isAddedInCart: true,
      color: Color(0xffFFE3E2),
    ),
    ProductModel(
      image: AppImages.fruit6,
      title: 'Fresh Broccoli',
      price: '\$3.00',
      availableQty: '1kg',
      isAddedInCart: false,
      isFavorite: true,
      color: const Color(0xffD2FFD0),
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

  void addToCart(int index) {
    final product = featuredProducts[index];
    featuredProducts[index] = ProductModel(
      image: product.image,
      title: product.title,
      price: product.price,
      availableQty: product.availableQty,
      isAddedInCart: true,
      isFavorite: product.isFavorite,
      quantity: 1,
      color: product.color,
    );
    notifyListeners();
  }

  void removeFromCart(int index) {
    final product = featuredProducts[index];
    featuredProducts[index] = ProductModel(
      image: product.image,
      title: product.title,
      price: product.price,
      availableQty: product.availableQty,
      isAddedInCart: false,
      isFavorite: product.isFavorite,
      quantity: 1,
      color: product.color,
    );
    notifyListeners();
  }

  void increaseQuantity(int index) {
    final product = featuredProducts[index];
    final newQuantity = product.quantity + 1;
    featuredProducts[index] = ProductModel(
      image: product.image,
      title: product.title,
      price: product.price,
      availableQty: product.availableQty,
      isAddedInCart: product.isAddedInCart,
      isFavorite: product.isFavorite,
      quantity: newQuantity,
      color: product.color,
    );
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    final product = featuredProducts[index];
    if (product.quantity > 1) {
      final newQuantity = product.quantity - 1;
      featuredProducts[index] = ProductModel(
        image: product.image,
        title: product.title,
        price: product.price,
        availableQty: product.availableQty,
        isAddedInCart: product.isAddedInCart,
        isFavorite: product.isFavorite,
        quantity: newQuantity,
        color: product.color,
      );
      notifyListeners();
    } else {
      removeFromCart(index);
    }
  }

  void toggleFavorite(int index) {
    final product = featuredProducts[index];
    featuredProducts[index] = ProductModel(
      image: product.image,
      title: product.title,
      price: product.price,
      availableQty: product.availableQty,
      isAddedInCart: product.isAddedInCart,
      isFavorite: !product.isFavorite,
      quantity: product.quantity,
      color: product.color,
    );
    notifyListeners();
  }

  void navigateToCategoriesView(BuildContext context) {
    context.push(AppRoutes.categories, extra: categories);
  }
}
