import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/home_view_widgets.dart';
import 'package:grocery_app/utils/custom_ui_clippers.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:provider/provider.dart';

class ProductDetailWidgets {
  static Stack productImageContainer({
    required BuildContext context,
    required ProductModel product,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: ProductDetailColorContainer(),
          child: Container(
            width: context.width,
            height: context.height * 0.5,
            decoration: BoxDecoration(color: product.color),
          ),
        ),
        Positioned(
          bottom: 30,
          // child: Image.asset(product.image, width: 250, height: 250,),
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        // back icon
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 20,
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back_outlined, color: AppColors.blackColor),
          ),
        ),
      ],
    );
  }

  static Row productPriceAndFavIcon({
    required HomeViewModel viewModel,
    required ProductModel product,
    required int index,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.price,
          style: AppTextStyles.appBarTitleStyle.copyWith(
            color: AppColors.priceColor,
          ),
        ),
        Selector<HomeViewModel, ProductModel>(
          selector: (context, viewModel) => viewModel.featuredProducts[index],
          builder: (context, product, child) {
            return HomeViewWidgets.favoriteButton(viewModel, index, product);
          },
        ),
      ],
    );
  }

  static SizedBox quantityCard({
    required HomeViewModel viewModel,
    required int index,
    required ProductModel product,
    required BuildContext context,
  }) {
    return SizedBox(
      width: context.width,
      height: 50,
      child: Card(
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Quantity", style: AppTextStyles.cartCountStyle),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: InkWell(
                      child: Image.asset(AppImages.minusIcon),
                      onTap: () {
                        viewModel.decreaseQuantity(index);
                      },
                    ),
                  ),
                  VerticalDivider(color: AppColors.dividerColor, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      product.quantity.toString(),
                      style: AppTextStyles.appBarTitleStyle,
                    ),
                  ),
                  VerticalDivider(color: AppColors.dividerColor, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: InkWell(
                      child: Image.asset(AppImages.plusIcon),
                      onTap: () {
                        viewModel.increaseQuantity(index);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Selector<HomeViewModel, bool> productDescription({
    required HomeViewModel viewModel,
    required ProductModel product,
  }) {
    return Selector<HomeViewModel, bool>(
      selector: (context, viewModel) => viewModel.showMore,
      builder: (context, value, child) {
        final noOfSubstrings = (context.height * 0.4).toInt();
        return RichText(
          text: TextSpan(
            text:
                viewModel.showMore
                    ? product.description
                    : (product.description.length > noOfSubstrings
                        ? "${product.description.substring(0, noOfSubstrings)}..."
                        : product.description),
            style: AppTextStyles.cartCountStyle.copyWith(
              color: AppColors.greyTextColor,
              height: 1.5,
            ),
            children: [
              WidgetSpan(
                child: InkWell(
                  onTap: () {
                    viewModel.toggleShowMore();
                  },
                  child: Text(
                    viewModel.showMore ? " Less" : " More",
                    style: AppTextStyles.cartCountStyle,
                  ),
                ),
              ),
            ],
          ),
          textAlign: TextAlign.justify,
        );
      },
    );
  }

  static Row ratingAndReviews({
    bool showReviews = true,
    Function()? onReviewsTap,
    double? rating,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("${rating ?? 4.5}", style: AppTextStyles.cartCountStyle),
        const SizedBox(width: 5),
        StarRating(
          rating: rating ?? 4.5,
          color: AppColors.starColor,
          onRatingChanged: (rating) {
            // viewModel.setRating(rating);
          },
        ),
        if (showReviews) ...[
          const SizedBox(width: 5),
          InkWell(
            onTap: onReviewsTap,
            child: Text(
              "(2.3k Reviews)",
              style: AppTextStyles.cartCountStyle.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
