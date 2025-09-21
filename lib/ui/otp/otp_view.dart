import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/otp/otp_view_model.dart';
import 'package:grocery_app/utils/validators.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OtpViewModel>();
    return Scaffold(
      appBar: appBarWidget(title: AppStrings.otpTitle, context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(AppStrings.verifyTitle, style: AppTextStyles.title),
            const SizedBox(height: 10),
            Text(
              AppStrings.otpDescription,
              style: AppTextStyles.onboardingDescriptionStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Consumer<OtpViewModel>(
              builder: (context, viewModel, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Pinput(
                    length: 6,
                    controller: viewModel.otpController,
                    onSubmitted: viewModel.setErrorText,
                    onCompleted: viewModel.setErrorText,
                    forceErrorState: true,
                    errorText: viewModel.errorText,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              buttonText: AppStrings.next,
              onButtonPressed: () {
                if (viewModel.errorText == null &&
                    viewModel.otpController.text.isNotEmpty) {
                  // Process data.
                  print("OTP Entered: ${viewModel.otpController.text}");
                } else {
                  viewModel.setErrorText(viewModel.otpController.text);
                }
              },
            ),
            const SizedBox(height: 15),
            Text(
              AppStrings.didntReceiveCode,
              style: AppTextStyles.onboardingDescriptionStyle.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            Text(
              AppStrings.resendCodeCounterText,
              style: AppTextStyles.onboardingDescriptionStyle.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
