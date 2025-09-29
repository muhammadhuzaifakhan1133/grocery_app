
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/filters/filters_view_model.dart';
import 'package:provider/provider.dart';

class StarRatingFilterField extends StatelessWidget {
  const StarRatingFilterField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rating = context.select<FiltersViewModel, double>((value) => value.rating);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Price Range", style: AppTextStyles.productTitlleStyle),
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: StarRating(
                    mainAxisAlignment: MainAxisAlignment.start,
                    rating: rating,
                    color: AppColors.starColor,
                    onRatingChanged: (rating) {
                      context.read<FiltersViewModel>().updateRating(rating);
                    },
                  ),
                ),
                Text(
                  "$rating Stars",
                  style: AppTextStyles.categoryTitleStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
