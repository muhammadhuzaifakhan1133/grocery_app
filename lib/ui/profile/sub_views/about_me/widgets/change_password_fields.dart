import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/profile/sub_views/about_me/about_me_view_model.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:grocery_app/widgets/password_dot.dart';
import 'package:provider/provider.dart';

class ChangePasswordFields extends StatelessWidget {
  const ChangePasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AboutMeViewModel>();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Change Password", style: AppTextStyles.appBarTitleStyle),
        ),
        SizedBox(height: 10),
        CustomTextField(
          controller: viewModel.currentPasswordController,
          hintText: "Current Password",
          prefixIcon: Image.asset(AppImages.lockIcon),
          obscureText: context.select<AboutMeViewModel, bool>(
            (vm) => vm.obscureNewPassword,
          ),
        ),
        SizedBox(height: 5),
        CustomTextField(
          controller: viewModel.newPasswordController,
          obscureText: context.select<AboutMeViewModel, bool>(
            (vm) => vm.obscureNewPassword,
          ),
          prefixIcon: Image.asset(AppImages.lockIcon),
          hintWidget: Row(children: List.generate(6, (index) => passwordDot())),
          suffixIcon: IconButton(
            onPressed: viewModel.togglePasswordVisibility,
            icon: Icon(
              viewModel.obscureNewPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: AppColors.greyTextColor,
            ),
          ),
        ),
        SizedBox(height: 5),
        CustomTextField(
          controller: viewModel.newPasswordController,
          obscureText: context.select<AboutMeViewModel, bool>(
            (vm) => vm.obscureNewPassword,
          ),
          hintText: "Confirm Password",
          prefixIcon: Image.asset(AppImages.lockIcon),
        ),
      ],
    );
  }
}
