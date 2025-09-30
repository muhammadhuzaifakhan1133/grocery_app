import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/auth/signup/signup_view_model.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/utils/validators.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/backgrond_stacked_image.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:grocery_app/widgets/password_dot.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpViewModel viewModel = context.read<SignUpViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: AppStrings.welcome,
        context: context,
        textColor: AppColors.whiteColor,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          backgroundStackedImage(
            context: context,
            heightFactor: 0.5,
            imagePath: AppImages.signupBackground,
          ),
          contentSection(context, viewModel),
        ],
      ),
    );
  }

  Positioned contentSection(BuildContext context, SignUpViewModel viewModel) {
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
        // height: context.height * 0.5,
        decoration: containerDecoration,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.createAccount, style: AppTextStyles.title),
            SizedBox(height: 5),
            Text(
              AppStrings.createAccountDescription,
              style: AppTextStyles.onboardingDescriptionStyle,
            ),
            SizedBox(height: 15),
            signUpForm(viewModel),
            SizedBox(height: 15),
            CustomButton(
              buttonText: AppStrings.signup,
              onButtonPressed: () {
                if (viewModel.formKey.currentState!.validate()) {
                  context.pushReplacement(AppRoutes.homeNavigation);
                }
              },
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: RichText(
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
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              context.pushReplacement(AppRoutes.login);
                            },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form signUpForm(SignUpViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomTextField(
            controller: viewModel.emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: AppStrings.emailAddress,
            prefixIcon: Image.asset(AppImages.emailIcon),
            validator: FieldValidators.emailValidator,
          ),
          SizedBox(height: 5),
          CustomTextField(
            controller: viewModel.phoneController,
            hintText: AppStrings.phoneNumber,
            keyboardType: TextInputType.phone,
            prefixIcon: Image.asset(AppImages.phoneIcon),
            validator: FieldValidators.phoneValidator,
          ),
          SizedBox(height: 5),
          Selector<SignUpViewModel, bool>(
            selector: (_, vm) => vm.isPasswordVisible,
            builder: (context, isPasswordVisible, child) {
              return CustomTextField(
                controller: viewModel.passwordController,
                hintWidget: Row(
                  children: List.generate(6, (index) => passwordDot()),
                ),
                prefixIcon: Image.asset(AppImages.lockIcon),
                validator: FieldValidators.passwordValidator,
                suffixIcon: IconButton(
                  onPressed: () {
                    viewModel.togglePasswordVisibility();
                  },
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.greyTextColor,
                  ),
                ),
                obscureText: !isPasswordVisible,
              );
            },
          ),
        ],
      ),
    );
  }
}
