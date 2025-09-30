import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/widgets/add_credit_card_form.dart';

class PaymentStep3 extends StatelessWidget {
  const PaymentStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _step3Container(image: AppImages.step3Icon1, text: 'Paypal'),
            const SizedBox(width: 22),
            _step3Container(image: AppImages.step3Icon2, text: 'Credit Card'),
            const SizedBox(width: 22),
            _step3Container(image: AppImages.step3Icon3, text: 'Apple Pay'),
          ],
        ),
        const SizedBox(height: 18),
        AddCreditCardForm(),
      ],
    );
  }

  Expanded _step3Container({required String image, required String text}) {
    return Expanded(
      child: Container(
        height: 100,
        color: AppColors.whiteColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              const SizedBox(height: 18),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
