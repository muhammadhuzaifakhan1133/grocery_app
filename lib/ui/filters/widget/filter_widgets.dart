import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';

class FiltersWidgets {
  static Widget priceRangeFields({
    required TextEditingController minPriceController,
    required TextEditingController maxPriceController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Price Range", style: AppTextStyles.productTitlleStyle),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CustomTextField(
                  height: 45,
                  controller: minPriceController,
                  hintText: "Min",
                  fillColor: AppColors.scaffoldBackgroundColor,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  controller: maxPriceController,
                  height: 45,
                  hintText: "Max",
                  fillColor: AppColors.scaffoldBackgroundColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

