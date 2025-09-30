import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';

class DeliveryStep1 extends StatelessWidget {
  const DeliveryStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 18),
        deliveryOption(
          title: "Standard Delivery",
          description:
              "Order will be delivered between 3 - 4 business days straights to your doorstep.",
          price: "\$3",
        ),
        const SizedBox(height: 18),
        deliveryOption(
          title: "Next Day Delivery",
          description:
              "Order will be delivered between 3 - 4 business days straights to your doorstep.",
          price: "\$5",
        ),
        const SizedBox(height: 18),
        deliveryOption(
          title: "Nominated Delivery",
          description:
              "Order will be delivered between 3 - 4 business days straights to your doorstep.",
          price: "\$8",
        ),
      ],
    );
  }

  Container deliveryOption({
    required String title,
    required String description,
    required String price,
  }) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 22),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.productTitlleStyle),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: AppTextStyles.categoryTitleStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: AppTextStyles.productPriceStyle.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
