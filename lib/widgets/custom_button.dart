import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/utils/extensions.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback? onButtonPressed;
  final String buttonText;
  final TextStyle? textStyle;
  final String? iconImage;
  final Color? buttonColor;
  final double? iconLeftPadding;
  final bool? isIconRight;
  final bool? isButtonDisabled;
  const CustomButton({
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
    this.isIconRight = false,
    this.isButtonDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width * 0.9,
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
        onPressed: isButtonDisabled == true ? null : onButtonPressed,
        style:
            isButtonDisabled == true
                ? TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.grey,
                  disabledBackgroundColor: Colors.grey,
                )
                : null,
        child:
            iconImage == null
                ? Text(
                  buttonText,
                  style: textStyle ?? AppTextStyles.buttonStyle,
                )
                : Row(
                  children: [
                    if (iconImage != null && isIconRight == false) ...[
                      Padding(
                        padding: EdgeInsets.only(left: iconLeftPadding ?? 10),
                        child: Image.asset(iconImage!, width: 20, height: 20),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            buttonText,
                            style: textStyle ?? AppTextStyles.buttonStyle,
                          ),
                        ),
                      ),
                      SizedBox(width: context.width * 0.05),
                    ],
                    if (iconImage != null && isIconRight == true) ...[
                      Expanded(
                        child: Center(
                          child: Text(
                            buttonText,
                            style: textStyle ?? AppTextStyles.buttonStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: iconLeftPadding ?? 10),
                        child: Image.asset(iconImage!, width: 20, height: 20),
                      ),
                    ],
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