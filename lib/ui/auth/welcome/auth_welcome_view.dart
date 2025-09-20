import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/button_widget.dart';

class AuthWelcomeView extends StatelessWidget {
  const AuthWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: AppStrings.welcome, context: context),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          backgroundImage(context),
          // content section
          contentSection(context),
        ],
      ),
    );
  }

  Positioned contentSection(BuildContext context) {
    BoxDecoration containerDecoration = BoxDecoration(
      color: AppColors.scaffoldBackgroundColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    );
    return Positioned(
      bottom: 0,
      child: Container(
        width: context.width,
        constraints: BoxConstraints(minHeight: context.height * 0.3),
        decoration: containerDecoration,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(AppStrings.welcome, style: AppTextStyles.title),
            ),
            SizedBox(height: 5),
            Text(
              AppStrings.welcomeAuthDescription,
              style: AppTextStyles.onboardingDescriptionStyle,
            ),
            SizedBox(height: 15),
            authButtons(context),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: AppStrings.alreadyHaveAnAccount,
                style: AppTextStyles.onboardingDescriptionStyle,
                children: [
                  TextSpan(
                    text: AppStrings.login,
                    style: AppTextStyles.onboardingDescriptionStyle.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column authButtons(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          buttonText: AppStrings.continueWithGoogle,
          width: context.width * 0.9,
          iconImage: AppImages.googleIcon,
          buttonColor: AppColors.whiteColor,
          textStyle: AppTextStyles.buttonStyle.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        ButtonWidget(
          buttonText: AppStrings.createAccount,
          width: context.width * 0.9,
          iconImage: AppImages.createAccount,
        ),
      ],
    );
  }

  Positioned backgroundImage(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: context.width,
        height: context.height * 0.7,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.welcomeBackground),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
