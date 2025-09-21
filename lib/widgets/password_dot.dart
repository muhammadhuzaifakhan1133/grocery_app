import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';

Widget passwordDot() {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: AppColors.greyTextColor,
        shape: BoxShape.circle,
      ),
    );
  }