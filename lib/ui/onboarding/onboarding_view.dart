import 'package:flutter/material.dart';
import 'package:grocery_app/ui/onboarding/onboarding_view_model.dart';
import 'package:grocery_app/ui/onboarding/widgets/onboarding_widget.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<OnboardingViewModel>();
    return Scaffold(
      body: PageView.builder(
        controller: notifier.pageController,
        itemCount: notifier.onboardingData.length,
        itemBuilder: (context, index) {
          final data = notifier.onboardingData[index];
          return OnboardingWidget(
            data: data,
            currentIndex: index,
            totalPages: notifier.onboardingData.length,
            onButtonPressed: () {
              notifier.onButtonPressed(index, context);
            },
          );
        },
      ),
    );
  }
}
