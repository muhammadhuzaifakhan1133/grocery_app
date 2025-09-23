import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/home_ad_banner.dart';
import 'package:grocery_app/ui/home/widgets/home_view_widgets.dart';
import 'package:grocery_app/ui/home/widgets/product_grid_view.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              CustomTextField(
                controller: TextEditingController(),
                prefixIcon: Image.asset(AppImages.searchIcon),
                hintText: AppStrings.searchKeywordHint,
                suffixIcon: Image.asset(AppImages.filterIcon),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  HomeAdBanner(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.categoriesTitle,
                        style: AppTextStyles.appBarTitleStyle,
                      ),
                      IconButton(
                        onPressed: () {
                          viewModel.navigateToCategoriesView(context);
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  productCategories(viewModel),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.featuredproducts,
                        style: AppTextStyles.appBarTitleStyle,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ProductGridView(viewModel: viewModel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
