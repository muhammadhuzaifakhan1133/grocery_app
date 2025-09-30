import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/add_credit_card_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/widgets/card_widget.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/widgets/default_switch.dart';
import 'package:grocery_app/utils/input_formatters.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddCreditCardForm extends StatelessWidget {
  const AddCreditCardForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AddCreditCardViewModel>();

    return Column(
      children: [
        cardWidget(viewModel),
        const SizedBox(height: 18),
        Column(
          children: [
            CustomTextField(
              controller: viewModel.nameController,
              prefixIcon: Image.asset(
                AppImages.cardIcon2,
                height: 60,
                width: 60,
              ),
              hintText: "Russell Austin",
            ),
            const SizedBox(height: 5),
            CustomTextField(
              controller: viewModel.numberController,
              prefixIcon: Image.asset(AppImages.cardIcon),
              hintText: "XXXX  XXXX  XXXX  5678",
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16), // max 16 digits
                CardNumberInputFormatter(),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: viewModel.expiryController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset(AppImages.cardIcon3),
                    ),
                    hintText: "01/22",
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                        4,
                      ), // max 4 digits before adding slash
                      ExpiryDateInputFormatter(),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(),
                    prefixIcon: Image.asset(AppImages.cardIcon4),
                    hintText: "908",
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3), // max 3 digits
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 19),
            makeDefaultSwitch(viewModel),
          ],
        ),
      ],
    );
  }
}
