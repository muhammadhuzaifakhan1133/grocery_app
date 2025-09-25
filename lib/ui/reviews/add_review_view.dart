import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/reviews/reviews_vew_model.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddReviewView extends StatelessWidget {
  const AddReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModle = context.read<ReviewsVewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "Write Reviews",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              "What do you think?",
              style: AppTextStyles.title.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: context.width * 0.7,
              child: Text(
                "please give your rating by clicking on the stars below",
                textAlign: TextAlign.center,
                style: AppTextStyles.onboardingDescriptionStyle,
              ),
            ),
            const SizedBox(height: 20),
            Selector<ReviewsVewModel, double>(
              selector: (_, vm) => vm.currentRating,
              builder: (context, rating, child) {
                return StarRating(
                  size: 40,
                  allowHalfRating: true,
                  color: AppColors.starColor,
                  rating: rating,
                  onRatingChanged: (rating) {
                    viewModle.changeRating(rating);
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: TextEditingController(),
              maxLines: 6,
              hintWidget: Row(
                children: [
                  Image.asset(AppImages.editIcon),
                  const SizedBox(width: 8),
                  Text(
                    "Tell us about your experience",
                    style: AppTextStyles.hintTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            CustomButton(buttonText: "Submit Review"),
          ],
        ),
      ),
    );
  }
}
