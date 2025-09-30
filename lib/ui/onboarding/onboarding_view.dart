import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/onboarding_data.dart';
import 'package:grocery_app/ui/onboarding/onboarding_view_model.dart';
import 'package:grocery_app/ui/onboarding/widgets/onboarding_widget.dart';
import 'package:grocery_app/utils/custom_ui_clippers.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<OnboardingViewModel>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: context.width,
              height: context.height * 0.65,
              child: PageView.builder(
                controller: notifier.pageController,
                itemCount: notifier.onboardingData.length,
                onPageChanged: notifier.onPageChanged,
                itemBuilder: (context, index) {
                  final data = notifier.onboardingData[index];
                  return Container(
                    width: context.width,
                    height: context.height * 0.65,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(data.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: ContentSection(),
          ),
        ],
      ),
    );
  }
}

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<OnboardingViewModel>();
    final int noOfPages = notifier.onboardingData.length;
    final int currentPage = notifier.currentPage;
    final OnboardingDataModel data = notifier.onboardingData[currentPage];
    final String title = data.title;
    final String description = data.description;
    return ClipPath(
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
            titleWidget(title),
            const SizedBox(height: 20),
            descriptionWidget(description),
            const SizedBox(height: 40),
            pageIndicators(
              noOfPages: noOfPages,
              currentPage: currentPage,
              onPressedIndicator: (value) {
                notifier.jumpToPage(value);
              },
            ),
            const SizedBox(height: 30),
            onboardingButton(
              context: context,
              noOfPages: noOfPages,
              currentPage: currentPage,
              onButtonPressed: () {
                notifier.onButtonPressed(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

CustomButton onboardingButton({
  required BuildContext context,
  required int noOfPages,
  required int currentPage,
  required VoidCallback onButtonPressed,
}) {
  return CustomButton(
    width: context.width * 0.85,
    onButtonPressed: onButtonPressed,
    buttonText: "",
    child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(
        currentPage == noOfPages - 1 ? AppStrings.getStarted : AppStrings.next,
        key: ValueKey(currentPage),
        style: AppTextStyles.buttonStyle,
      ),
    ),
  );
}

Row pageIndicators({
  required int noOfPages,
  required int currentPage,
  required Function(int) onPressedIndicator,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(
      noOfPages,
      (index) => GestureDetector(
        onTap: () {
          onPressedIndicator(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color:
                index == currentPage
                    ? AppColors.primaryDarkColor
                    : AppColors.inactiveColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ),
  );
}

Widget descriptionWidget(String description) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    transitionBuilder: (child, animation) {
      return FadeTransition(opacity: animation, child: child);
    },
    child: Text(
      description,
      key: ValueKey(description),
      textAlign: TextAlign.center,
      style: AppTextStyles.onboardingDescriptionStyle,
    ),
  );
}

Widget titleWidget(String title) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    transitionBuilder: (child, animation) {
      return FadeTransition(opacity: animation, child: child);
    },
    child: Text(
      title,
      key: ValueKey(title),
      textAlign: TextAlign.center,
      style: AppTextStyles.onboardingTitleStyle,
    ),
  );
}
