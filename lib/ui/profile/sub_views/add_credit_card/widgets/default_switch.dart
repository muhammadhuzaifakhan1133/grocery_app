import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/add_credit_card_view_model.dart';
import 'package:provider/provider.dart';

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