
import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/home_view_widgets.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:provider/provider.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: context.width / (context.height * 0.62),
      ),
      itemCount: viewModel.featuredProducts.length,
      itemBuilder: (context, index) {
        return Selector<HomeViewModel, ProductModel>(
          selector:
              (context, viewModel) =>
                  viewModel.featuredProducts[index],
          builder: (context, product, child) {
            return Card(
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
                  favoriteButton(viewModel, index, product),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
