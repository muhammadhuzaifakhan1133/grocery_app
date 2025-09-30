import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final double? height;
  final int maxLines;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
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
    this.height,
    this.maxLines = 1,
    this.enabled,
    this.inputFormatters,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width * 0.9,
      height: height,
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        inputFormatters: inputFormatters,
        enabled: enabled,
        maxLines: maxLines,
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
          fillColor:
              enabled == false
                  ? AppColors.greyColor.shade100
                  : (fillColor ?? AppColors.whiteColor),
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
