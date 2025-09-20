import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';

class AppTextStyles {
  static TextStyle onboardingTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
    shadows: [
      Shadow(
            color: AppColors.blackColor.withOpacity(0.5),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
    ],
  );

  static const TextStyle onboardingDescriptionStyle = TextStyle(
    fontSize: 16,
    color: AppColors.greyTextColor,
  );

  static const TextStyle buttonStyle = TextStyle(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
  );
}