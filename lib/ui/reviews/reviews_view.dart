import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/product_detail/widgets/product_detail_widgets.dart';
import 'package:grocery_app/ui/reviews/reviews_vew_model.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ReviewsVewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "Reviews",
        context: context,
        backgroundColor: AppColors.whiteColor,
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.addReview);
            },
            icon: Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      body: Scaffold(
        body: ListView.builder(
          itemCount: viewModel.reviews.length,
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 15),
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    MediaQuery(
                      data: MediaQueryData(padding: EdgeInsets.zero),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(right: 0, left: 0),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            viewModel.reviews[index].profileImage,
                          ),
                        ),
                        title: Text(
                          viewModel.reviews[index].name,
                          style: AppTextStyles.productTitlleStyle,
                        ),
                        subtitle: Text(
                          viewModel.reviews[index].date,
                          style: AppTextStyles.categoryTitleStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Divider(height: 1, color: AppColors.dividerColor),
                    const SizedBox(height: 15),
                    ProductDetailWidgets.ratingAndReviews(
                      showReviews: false,
                      rating: viewModel.reviews[index].rating,
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        viewModel.reviews[index].reviewText,
                        style: AppTextStyles.onboardingDescriptionStyle
                            .copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
