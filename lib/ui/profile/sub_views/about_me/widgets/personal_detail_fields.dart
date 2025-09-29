import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/profile/sub_views/about_me/about_me_view_model.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class PersonalDetailFields extends StatelessWidget {
  const PersonalDetailFields({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AboutMeViewModel>();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Personal Details",
            style: AppTextStyles.appBarTitleStyle,
          ),
        ),
        SizedBox(height: 10),
        CustomTextField(
          controller: viewModel.nameController,
          hintText: "Russell Austin",
          prefixIcon: Image.asset(AppImages.aboutMe1),
        ),
        SizedBox(height: 5),
        CustomTextField(
          controller: viewModel.emailController,
          hintText: "russell.partner@gmail.com",
          prefixIcon: Image.asset(AppImages.aboutMe2),
        ),
        SizedBox(height: 5),
        CustomTextField(
          controller: viewModel.phoneController,
          hintText: "+1 202 555 0142",
          prefixIcon: Image.asset(AppImages.aboutMe3),
        ),
      ],
    );
  }
}
