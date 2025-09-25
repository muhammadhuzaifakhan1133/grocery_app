import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/home_view_widgets.dart';
import 'package:grocery_app/ui/product_detail/widgets/product_detail_widgets.dart';
import 'package:grocery_app/utils/custom_ui_clippers.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatelessWidget {
  final ProductModel product;
  final int index;
  const ProductDetailView({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          ProductDetailWidgets.productImageContainer(context: context, product: product),
          Expanded(
            child: Container(
              width: context.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                color: AppColors.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  ProductDetailWidgets.productPriceAndFavIcon(viewModel: viewModel, product: product, index: index),
                  const SizedBox(height: 3),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.title,
                      style: AppTextStyles.productTitlleStyle.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.availableQty,
                      style: AppTextStyles.categoryTitleStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ProductDetailWidgets.ratingAndReviews(),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ProductDetailWidgets.productDescription(viewModel: viewModel, product: product),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ProductDetailWidgets.quantityCard(viewModel: viewModel, index: index, product: product, context: context),
                  const SizedBox(height: 10),
                  CustomButton(
                    buttonText: "Add to Cart",
                    iconImage: AppImages.whiteCartIcon,
                    isIconRight: true,
                    onButtonPressed: () {
                      viewModel.addToCart(index);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }  
}
