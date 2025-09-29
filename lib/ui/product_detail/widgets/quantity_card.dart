import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CartQuantityAndButton extends StatelessWidget {
  const CartQuantityAndButton({
    super.key,
    required this.viewModel,
    required this.index,
  });

  final HomeViewModel viewModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final int cartQuantity = context.select<HomeViewModel, int>(
      (vm) => vm.getCartQuantity(index),
    );
    return Column(
      children: [
        SizedBox(
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
                      VerticalDivider(
                        color: AppColors.dividerColor,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          cartQuantity.toString(),
                          style: AppTextStyles.appBarTitleStyle,
                        ),
                      ),
                      VerticalDivider(
                        color: AppColors.dividerColor,
                        thickness: 1,
                      ),
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
        ),
        const SizedBox(height: 10),
        if (cartQuantity == 0)
          CustomButton(
            buttonText: "Add to Cart",
            iconImage: AppImages.whiteCartIcon,
            isIconRight: true,
            onButtonPressed: () {
              viewModel.increaseQuantity(index);
            },
          ),
        // already added cart button (disabled)
        if (cartQuantity > 0)
          CustomButton(
            buttonText: "Added to Cart",
            isButtonDisabled: true,
          )
        
      ],
    );
  }
}
