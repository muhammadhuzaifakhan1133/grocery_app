import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';

AppBar appBarWidget({required String title, required BuildContext context}) {
  return AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(title, style: AppTextStyles.appBarTitleStyle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
}