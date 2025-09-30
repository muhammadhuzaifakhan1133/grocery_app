import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/add_credit_card_view_model.dart';
import 'package:provider/provider.dart';

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