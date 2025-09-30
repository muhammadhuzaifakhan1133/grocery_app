import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/models/onboarding_data.dart';
import 'package:grocery_app/routes/routes.dart';

class OnboardingViewModel extends ChangeNotifier {
  // page view controller
  PageController pageController = PageController();
  // current page index in page view
  int currentPage = 0;
  // onboarding data
  List<OnboardingDataModel> onboardingData = [
    OnboardingDataModel(
      imagePath: AppImages.onboarding1,
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDescription1,
    ),
    OnboardingDataModel(
      imagePath: AppImages.onboarding2,
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDescription2,
    ),
    OnboardingDataModel(
      imagePath: AppImages.onboarding3,
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingDescription3,
    ),
    OnboardingDataModel(
      imagePath: AppImages.onboarding4,
      title: AppStrings.onboardingTitle4,
      description: AppStrings.onboardingDescription4,
    ),
  ];

  /// Called only by PageView when user swipes
  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  /// Called when indicator is tapped
  void jumpToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPage = index;
    notifyListeners();
  }

  /// Called when next/get started button pressed
  void onButtonPressed(BuildContext context) {
    if (currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.push(AppRoutes.welcome);
    }
  }
}
