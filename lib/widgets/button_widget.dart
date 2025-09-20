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
  final TextStyle? textStyle;
  final String? iconImage;
  final Color? buttonColor;
  final double? iconLeftPadding;
  const ButtonWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.onButtonPressed,
    required this.buttonText,
    this.textStyle,
    this.iconImage,
    this.buttonColor,
    this.iconLeftPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
        color: buttonColor,
        gradient:
            buttonColor == null
                ? LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.primaryDarkColor],
                )
                : null,
      ),
      child: TextButton(
        onPressed: onButtonPressed,
        child:
            iconImage == null
                ? Text(
                  buttonText,
                  style: textStyle ?? AppTextStyles.buttonStyle,
                )
                : Row(
                  children: [
                    if (iconImage != null)
                      Padding(
                        padding: EdgeInsets.only(left: iconLeftPadding ?? 10),
                        child: Image.asset(iconImage!, width: 20, height: 20),
                      ),
                    SizedBox(width: context.width * 0.13),
                    Text(
                      buttonText,
                      style: textStyle ?? AppTextStyles.buttonStyle,
                    ),
                  ],
                ),
      ),
    );
  }
}


// if (iconImage != null)
//               Positioned(
//                 left: iconLeftPadding ?? 5,
//                 child: Image.asset(iconImage!, width: 20, height: 20),
//               ),