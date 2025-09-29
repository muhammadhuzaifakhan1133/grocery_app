import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';

class ProfileCirlceAvatar extends StatelessWidget {
  const ProfileCirlceAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.profileImage),
                ),
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 10,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColors.whiteColor,
                    size: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text("Olivia Austin", style: AppTextStyles.productTitlleStyle),
        Text(
          "oliviaaustin@gmail.com",
          style: AppTextStyles.categoryTitleStyle.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}