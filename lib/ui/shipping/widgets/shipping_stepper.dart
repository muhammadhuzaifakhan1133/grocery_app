import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/shipping/shipping_view_model.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:provider/provider.dart';

class ShippingStepper extends StatelessWidget {
  const ShippingStepper({super.key});

  @override
  Widget build(BuildContext context) {
    int currentStep = context.select<ShippingViewModel, int>(
      (vm) => vm.pageNumber,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildStep("1", "DELIVERY", 1, currentStep),
        buildLine(2, currentStep, context),
        buildStep("2", "ADDRESS", 2, currentStep),
        buildLine(3, currentStep, context),
        buildStep("3", "PAYMENT", 3, currentStep),
      ],
    );
  }

  Widget buildStep(
    String number,
    String title,
    int stepIndex,
    int currentStep,
  ) {
    bool isCompleted = currentStep > stepIndex;
    bool isActive = currentStep == stepIndex;

    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                (isActive || isCompleted)
                    ? AppColors.primaryDarkColor
                    : AppColors.whiteColor,
            border:
                (isActive || isCompleted)
                    ? null
                    : Border.all(color: AppColors.greyColor.shade300),
          ),
          child: Center(
            child:
                isCompleted
                    ? Icon(Icons.check, color: AppColors.whiteColor, size: 18)
                    : Text(
                      number,
                      style:
                          isActive
                              ? AppTextStyles.buttonStyle
                              : AppTextStyles.buttonStyle.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                    ),
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: AppTextStyles.categoryTitleStyle),
      ],
    );
  }

  Widget buildLine(int stepIndex, int currentStep, BuildContext context) {
    bool isActive = currentStep >= stepIndex;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: context.width * 0.15,
        height: 2,
        color:
            isActive
                ? AppColors.primaryDarkColor
                : AppColors.greyColor.shade300,
      ),
    );
  }
}
