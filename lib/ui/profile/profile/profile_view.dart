import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/ui/profile/profile/widgets/profile_circle_avatar.dart';
import 'package:grocery_app/ui/profile/profile/widgets/profile_options.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(height: 100, color: AppColors.whiteColor),
        Column(
          children: [
            const SizedBox(height: 30),
            ProfileCirlceAvatar(),
            const SizedBox(height: 25),
            Expanded(child: ProfileOptions()),
          ],
        ),
      ],
    );
  }
}
