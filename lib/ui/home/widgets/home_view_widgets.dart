import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/category_card.dart';

Stack productImage(ProductModel product) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.furitCicle,
          shape: BoxShape.circle,
        ),
      ),
      Positioned(bottom: -8, child: Image.asset(product.image)),
    ],
  );
}

Padding cartCounter(HomeViewModel viewModel, int index, ProductModel product) {
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
        Text(product.quantity.toString(), style: AppTextStyles.cartCountStyle),
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

InkWell addToCartButton(HomeViewModel viewModel, int index) {
  return InkWell(
    onTap: () {
      viewModel.addToCart(index);
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

Positioned offerTag() {
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

Positioned favoriteButton(
  HomeViewModel viewModel,
  int index,
  ProductModel product,
) {
  return Positioned(
    top: 0,
    right: 0,
    child: InkWell(
      onTap: () {
        viewModel.toggleFavorite(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          product.isFavorite ? Icons.favorite : Icons.favorite_border,
          color:
              product.isFavorite
                  ? AppColors.favoriteColor
                  : AppColors.greyTextColor,
        ),
      ),
    ),

    // child: IconButton(
    //   padding: EdgeInsets.zero,
    //   onPressed: () {},
    //   icon: Icon(
    //     product.isFavorite
    //         ? Icons.favorite
    //         : Icons.favorite_border,

    //     color:
    //         product.isFavorite
    //             ? AppColors.favoriteColor
    //             : AppColors.greyTextColor,
    //   ),
    // ),
  );
}

SingleChildScrollView productCategories(HomeViewModel viewModel) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
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
