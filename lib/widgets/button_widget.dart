import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/utils/extensions.dart';

class ButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback? onButtonPressed;
  final String buttonText;
  const ButtonWidget({super.key, this.width, this.height, this.borderRadius, this.onButtonPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ??context.width * 0.85,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
        gradient: const LinearGradient(
          colors: [AppColors.primaryColor, AppColors.primaryDarkColor],
        ),
      ),
      child: TextButton(
        onPressed: onButtonPressed,
        child: Text(
          buttonText,
          style: AppTextStyles.buttonStyle,
        ),
      ),
    );
  }
}