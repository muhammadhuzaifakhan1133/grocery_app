import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/onboarding_data.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/utils/custom_ui_clippers.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/button_widget.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingDataModel data;
  final int currentIndex;
  final int totalPages;
  final Function() onButtonPressed;
  const OnboardingWidget({
    super.key,
    required this.data,
    required this.currentIndex,
    required this.totalPages,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [backgroundImage(context), contentSection(context)]);
  }

  Positioned contentSection(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipPath(
        clipper: OnboardingContainerClipper(),
        child: Container(
          width: context.width,
          constraints: BoxConstraints(minHeight: context.height * 0.45),
          color: AppColors.whiteColor,
          padding: const EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            top: 80.0,
            bottom: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 20),
              titleWidget(),
              const SizedBox(height: 20),
              descriptionWidget(),
              const SizedBox(height: 40),
              pageIndicators(),
              const SizedBox(height: 30),
              onboardingButton(context),
            ],
          ),
        ),
      ),
    );
  }

  ButtonWidget onboardingButton(BuildContext context) {
    return ButtonWidget(
      width: context.width * 0.85,
      buttonText:
          currentIndex == totalPages - 1
              ? AppStrings.getStarted
              : AppStrings.next,
      onButtonPressed: onButtonPressed,
    );
  }

  Row pageIndicators() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalPages,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color:
                index == currentIndex
                    ? AppColors.primaryDarkColor
                    : AppColors.inactiveColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Text descriptionWidget() {
    return Text(
      data.description,
      textAlign: TextAlign.center,
      style: AppTextStyles.onboardingDescriptionStyle,
    );
  }

  Text titleWidget() {
    return Text(
      data.title,
      textAlign: TextAlign.center,
      style: AppTextStyles.onboardingTitleStyle,
    );
  }

  Positioned backgroundImage(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: context.width,
        height: context.height * 0.65, // Top container for image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(data.imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
