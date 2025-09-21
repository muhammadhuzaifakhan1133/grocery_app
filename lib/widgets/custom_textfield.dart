import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final double? borderRadius;
  final double? borderWidth;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? hintWidget;
  final double? width;
  const CustomTextField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.borderRadius,
    this.borderWidth,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.hintWidget,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width * 0.9,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: AppTextStyles.hintTextStyle.copyWith(
          color: AppColors.blackColor,
        ),
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hint: hintText == null ? hintWidget : null,
          hintStyle: hintStyle ?? AppTextStyles.hintTextStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor ?? AppColors.whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide:
                borderWidth == null || borderWidth == 0
                    ? BorderSide.none
                    : BorderSide(width: borderWidth!),
          ),
        ),
      ),
    );
  }
}
