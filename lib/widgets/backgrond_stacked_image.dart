import 'package:flutter/material.dart';
import 'package:grocery_app/utils/extensions.dart';

Positioned backgroundStackedImage({required BuildContext context, required double heightFactor, required String imagePath}) {
    return Positioned(
      top: 0,
      child: Container(
        width: context.width,
        height: context.height * heightFactor,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }