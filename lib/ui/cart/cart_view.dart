import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/cart/cart_view_model.dart';
import 'package:grocery_app/ui/favorites/dismissible_product_card.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CartViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "Shopping Cart",
        context: context,
        showBackButton: false,
        backgroundColor: AppColors.whiteColor,
      ),
      bottomNavigationBar: Container(
        color: AppColors.whiteColor,
        width: context.width,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: AppTextStyles.hintTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  "\$${viewModel.subTotal}",
                  style: AppTextStyles.hintTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Charges",
                  style: AppTextStyles.hintTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  "\$${viewModel.shippingCharges}",
                  style: AppTextStyles.hintTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: AppTextStyles.appBarTitleStyle),
                Text(
                  "\$${viewModel.totalAmount}",
                  style: AppTextStyles.appBarTitleStyle,
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomButton(
              buttonText: "Checkout",
              onButtonPressed: () {
                context.push(AppRoutes.shipping);
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: viewModel.cartProducts.length,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        itemBuilder: (context, index) {
          final product = viewModel.cartProducts[index];
          return DismissibleProductCard(
            onDismissed: (_) => viewModel.removeProduct(product.product),
            product: product.product,
            cartQuantity: product.quantity,
            cardKey: Key(index.toString()),
            onPlusIconPressed: () {
              viewModel.increaseQuantity(product.product);
            },
            onMinusIconPressed: () {
              viewModel.decreaseQuantity(product.product);
            },
          );
        },
      ),
    );
  }
}
