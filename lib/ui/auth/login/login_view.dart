import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/auth/login/login_view_model.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/backgrond_stacked_image.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:grocery_app/widgets/password_dot.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = context.read<LoginViewModel>();
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
            imagePath: AppImages.loginBackground,
          ),
          contentSection(context, viewModel),
        ],
      ),
    );
  }

  Positioned contentSection(BuildContext context, LoginViewModel viewModel) {
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
        decoration: containerDecoration,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.loginWelcome, style: AppTextStyles.title),
            SizedBox(height: 5),
            Text(
              AppStrings.loginDescription,
              style: AppTextStyles.onboardingDescriptionStyle,
            ),
            SizedBox(height: 15),
            signupForm(viewModel),
            rememberMeAndForgotPassword(viewModel, context),
            SizedBox(height: 20),
            CustomButton(
              buttonText: AppStrings.login,
              onButtonPressed: () {
                if (viewModel.formKey.currentState!.validate()) {
                  context.push(AppRoutes.homeNavigation);
                }
              },
            ),
            SizedBox(height: 20),
            dontHaveAccountSignUp(context),
          ],
        ),
      ),
    );
  }

  Widget dontHaveAccountSignUp(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: AppStrings.dontHaveAnAccount,
          style: AppTextStyles.onboardingDescriptionStyle,
          children: [
            TextSpan(
              text: AppStrings.signup,
              style: AppTextStyles.onboardingDescriptionStyle.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      context.pushReplacement(AppRoutes.signup);
                    },
            ),
          ],
        ),
      ),
    );
  }

  Row rememberMeAndForgotPassword(
    LoginViewModel viewModel,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Selector<LoginViewModel, bool>(
              selector: (_, vm) => vm.rememberMe,
              builder: (context, rememberMe, child) {
                return Container(
                  // width: 50,
                  // height: 30,
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Checkbox(
                    value: viewModel.rememberMe,
                    onChanged: viewModel.toggleRememberMe,
                  ),
                );
              },
            ),
            Text(AppStrings.rememberMe, style: AppTextStyles.hintTextStyle),
          ],
        ),
        GestureDetector(
          onTap: () {
            context.push(AppRoutes.forgotPassword);
          },
          child: Text(
            AppStrings.forgotPassword,
            style: AppTextStyles.hintTextStyle.copyWith(
              color: AppColors.linkColor,
            ),
          ),
        ),
      ],
    );
  }

  Form signupForm(LoginViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomTextField(
            controller: viewModel.emailController,
            hintText: AppStrings.emailAddress,
            prefixIcon: Image.asset(AppImages.emailIcon),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              } else if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return "Please enter valid email";
              }
              return null;
            },
          ),
          SizedBox(height: 5),
          Selector<LoginViewModel, bool>(
            selector: (_, vm) => vm.isPasswordVisible,
            builder: (context, isPasswordVisible, child) {
              return CustomTextField(
                controller: viewModel.passwordController,
                obscureText: !isPasswordVisible,
                prefixIcon: Image.asset(AppImages.lockIcon),
                suffixIcon: IconButton(
                  onPressed: viewModel.togglePasswordVisibility,
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.greyTextColor,
                  ),
                ),
                hintWidget: Row(
                  children: List.generate(6, (index) => passwordDot()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter valid password";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              );
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
