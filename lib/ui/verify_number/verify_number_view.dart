import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/verify_number/verify_number_view_model.dart';
import 'package:grocery_app/utils/validators.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class VerifyNumberView extends StatelessWidget {
  const VerifyNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyNumberViewModel viewModel = context.read<VerifyNumberViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: AppStrings.verifyNumberTitle1,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(AppStrings.verifyNumberTitle2, style: AppTextStyles.title),
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
                controller: viewModel.phoneNumberController,
                // prefixIcon: Image.asset(AppImages.emailIcon),
                keyboardType: TextInputType.phone,
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: AppColors.greyTextColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: CountryCodePicker(
                    padding: EdgeInsets.zero,
                    initialSelection: "PK",
                  ),
                ),
                hintText: AppStrings.phoneNumber,
                validator: FieldValidators.phoneValidator,
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonText: AppStrings.next,
              onButtonPressed: () {
                if (viewModel.formKey.currentState!.validate()) {
                  // Process data.
                  context.push(AppRoutes.otp);
                }
              },
            ),
            // const SizedBox(height: 15),
            // Text(
            //   AppStrings.resendCodeCounterText,
            //   style: AppTextStyles.onboardingDescriptionStyle.copyWith(
            //     color: AppColors.blackColor,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}
