import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/ui/profile/sub_views/about_me/widgets/change_password_fields.dart';
import 'package:grocery_app/ui/profile/sub_views/about_me/widgets/personal_detail_fields.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_button.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: "About me",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              PersonalDetailFields(),
              const SizedBox(height: 30),
              ChangePasswordFields(),
              SizedBox(height: context.height * 0.1),
              CustomButton(buttonText: "Save Settings"),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
