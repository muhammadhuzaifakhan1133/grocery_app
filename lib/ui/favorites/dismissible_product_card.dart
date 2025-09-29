import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/ui/home/widgets/home_view_widgets.dart';

class DismissibleProductCard extends StatelessWidget {
  const DismissibleProductCard({
    super.key,
    required this.product,
    required this.cardKey,
    required this.onDismissed,
    this.inFavoriteScreen = false,
    this.cartQuantity = 0,
    this.onPlusIconPressed,
    this.onMinusIconPressed,
  });

  final Key cardKey;
  final bool inFavoriteScreen;
  final ProductModel product;
  final void Function(DismissDirection)? onDismissed;
  final int cartQuantity;
  final VoidCallback? onPlusIconPressed;
  final VoidCallback? onMinusIconPressed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      background: SizedBox(),
      secondaryBackground: Container(
        color: AppColors.deleteColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 30),
        child: Image.asset(AppImages.deleteIcon),
      ),
      key: cardKey,
      child: Card(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                HomeViewWidgets.productImage(product, width: 60, height: 60),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        inFavoriteScreen ? "\$${product.price}" : "\$${product.price} x $cartQuantity",
                        style: AppTextStyles.productPriceStyle,
                      ),
                      Text(
                        product.title,
                        style: AppTextStyles.productTitlleStyle,
                      ),
                      Text(
                        product.availableQty,
                        style: AppTextStyles.categoryTitleStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!inFavoriteScreen)
                  Column(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: onPlusIconPressed,
                        child: Image.asset(AppImages.plusIcon)),
                      Text(cartQuantity.toString(), style: AppTextStyles.hintTextStyle),
                      GestureDetector(
                        onTap: onMinusIconPressed,
                        child: Image.asset(AppImages.minusIcon)),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
