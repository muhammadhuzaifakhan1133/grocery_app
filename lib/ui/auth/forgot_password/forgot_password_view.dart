import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/auth/forgot_password/forgot_password_view_model.dart';
import 'package:grocery_app/utils/validators.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordViewModel viewModel = context.read<ForgotPasswordViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: AppStrings.passwordRecovery,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(AppStrings.forgotPassword, style: AppTextStyles.title),
            const SizedBox(height: 10),
            Text(
              AppStrings.forgotPasswordDescription,
              style: AppTextStyles.onboardingDescriptionStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Form(
              key: viewModel.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: CustomTextField(
                controller: viewModel.emailController,
                prefixIcon: Image.asset(AppImages.emailIcon),
                hintText: AppStrings.emailAddress,
                validator: FieldValidators.emailValidator,
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonText: AppStrings.sendLink,
              onButtonPressed: () {
                if (viewModel.formKey.currentState!.validate()) {
                  // Process data.
                  context.push(AppRoutes.verifyNumber);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
