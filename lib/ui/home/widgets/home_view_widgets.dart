import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/category_card.dart';

class HomeViewWidgets {
  static Stack productImage(
    ProductModel product, {
    double? width,
    double? height,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: product.color,
            shape: BoxShape.circle,
          ),
        ),
        Positioned(
          bottom: -8,
          child: Image.asset(product.image, width: width, height: height),
        ),
      ],
    );
  }

  static Padding cartCounter(
    HomeViewModel viewModel,
    int index,
    ProductModel product,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              viewModel.decreaseQuantity(index);
            },
            child: Image.asset(AppImages.minusIcon),
          ),
          Text(
            viewModel.getCartQuantity(index).toString(),
            style: AppTextStyles.cartCountStyle,
          ),
          InkWell(
            onTap: () {
              viewModel.increaseQuantity(index);
            },
            child: Image.asset(AppImages.plusIcon),
          ),
        ],
      ),
    );
  }

  static InkWell addToCartButton(HomeViewModel viewModel, int index) {
    return InkWell(
      onTap: () {
        viewModel.increaseQuantity(index);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.cartIcon),
          const SizedBox(width: 5),
          Text(AppStrings.addToCart, style: AppTextStyles.cartCountStyle),
        ],
      ),
    );
  }

  static Positioned offerTag() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.all(5),
        color: AppColors.offerContainerColor,
        child: Text(
          AppStrings.newText,
          style: AppTextStyles.categoryTitleStyle.copyWith(
            color: AppColors.offerTagColor,
          ),
        ),
      ),
    );
  }

  static Widget favoriteButton(
    HomeViewModel viewModel,
    int index,
    bool isFavorite,
  ) {
    return InkWell(
      onTap: () {
        viewModel.toggleFavorite(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color:
              isFavorite
                  ? AppColors.favoriteColor
                  : AppColors.greyTextColor,
        ),
      ),
    );
  }

  static SingleChildScrollView productCategories(HomeViewModel viewModel) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(viewModel.categories.length, (index) {
          final category = viewModel.categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CategoryCard(category: category),
          );
        }),
      ),
    );
  }
}
