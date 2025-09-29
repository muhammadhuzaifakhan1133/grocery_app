import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/add_credit_card_view_model.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/utils/input_formatters.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddCreditCardView extends StatelessWidget {
  const AddCreditCardView({super.key});

  /// Main API: takes raw input (may include spaces), returns formatted+masked string
  String maskAndFormatCardNumber(String input) {
    // 1) keep only digits
    final digits = input.replaceAll(RegExp(r'[^0-9]'), '');

    // 2) if <= 8 digits, show all digits (but still group every 4)
    if (digits.length <= 8) {
      return _groupEvery4(digits);
    }

    // 3) otherwise mask middle digits (keep first 4 and last 4)
    final first = digits.substring(0, 4);
    final last = digits.substring(digits.length - 4);
    final middle = List.filled(digits.length - 8, '*').join();
    final masked = '$first$middle$last';

    // 4) return grouped (XXXX XXXX ...)
    return _groupEvery4(masked);
  }

  /// helper: insert a space after every 4 characters
  String _groupEvery4(String s) {
    if (s.isEmpty) return s;
    final buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i != 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(s[i]);
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AddCreditCardViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "Add Credit Card",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
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
          ),
        ),
      ),
    );
  }

  Row makeDefaultSwitch(AddCreditCardViewModel viewModel) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            viewModel.toggleDefaultValue();
          },
          child: Selector<AddCreditCardViewModel, bool>(
            selector: (_, vm) => vm.makeDefault,
            builder: (context, value, child) {
              return Image.asset(
                value ? AppImages.switchOnIcon : AppImages.switchOffIcon,
              );
            },
          ),
        ),
        SizedBox(width: 8),
        Text("Make Default", style: AppTextStyles.productTitlleStyle),
      ],
    );
  }

  Center cardWidget(AddCreditCardViewModel viewModel) {
    return Center(
      child: Stack(
        children: [
          Image.asset(AppImages.creditCard),
          Positioned(
            left: 22,
            top: 65,
            child: Consumer<AddCreditCardViewModel>(
              builder: (_, _, _) {
                return Text(
                  maskAndFormatCardNumber(viewModel.numberController.text),
                  style: AppTextStyles.appBarTitleStyle.copyWith(
                    color: AppColors.whiteColor,
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 22,
            bottom: 15,
            child: Consumer<AddCreditCardViewModel>(
              builder: (_, _, _) {
                return Text(
                  viewModel.nameController.text,
                  style: AppTextStyles.cartCountStyle.copyWith(
                    color: AppColors.whiteColor,
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: 44,
            bottom: 15,
            child: Consumer<AddCreditCardViewModel>(
              builder: (_, _, _) {
                return Text(
                  viewModel.expiryController.text,
                  style: AppTextStyles.cartCountStyle.copyWith(
                    color: AppColors.whiteColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
