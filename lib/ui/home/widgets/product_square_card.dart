
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/home_view_widgets.dart';

class ProductSquareCard extends StatelessWidget {
  const ProductSquareCard({
    super.key,
    required this.viewModel, required this.index, required this.product,
  });

  final HomeViewModel viewModel;
  final int index;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product detail view
        context.pushNamed(AppRoutes.productDetails, extra: product, queryParameters: {'index': index.toString()});
      },
      child: Card(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        margin: EdgeInsets.zero,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      productImage(product),
                      const SizedBox(height: 10),
                      Text(
                        product.price,
                        style:
                            AppTextStyles.productPriceStyle,
                      ),
                      Text(
                        product.title,
                        style:
                            AppTextStyles
                                .productTitlleStyle,
                      ),
                      Text(
                        product.availableQty,
                        style:
                            AppTextStyles
                                .categoryTitleStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Divider(
                  height: 1,
                  color: AppColors.inactiveColor,
                ),
                const SizedBox(height: 10),
                if (product.isAddedInCart)
                  cartCounter(viewModel, index, product),
          
                if (!product.isAddedInCart)
                  addToCartButton(viewModel, index),
              ],
            ),
            offerTag(),
            Positioned(
              top: 0,
              right: 0,
              child: favoriteButton(viewModel, index, product)),
          ],
        ),
      ),
    );
  }
}
