import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';

AppBar appBarWidget({
  required String title,
  required BuildContext context,
  Color textColor = AppColors.blackColor,
  Color? backgroundColor,
  List<Widget>? actions,
}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: backgroundColor ?? AppColors.transparent,
    actions: actions,
    title: Text(
      title,
      style: AppTextStyles.appBarTitleStyle.copyWith(color: textColor),
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: textColor),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
