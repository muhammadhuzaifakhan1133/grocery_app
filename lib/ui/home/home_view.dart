import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_strings.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/home_ad_banner.dart';
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
                        onPressed: () {},
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
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: context.width / (context.height * 0.82),
                    ),
                    // itemCount: viewModel.featuredProducts.length,
                    itemCount: viewModel.featuredProducts.length,
                    itemBuilder: (context, index) {
                      final product = viewModel.featuredProducts[index];
                      return Card(
                        color: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        margin: EdgeInsets.zero,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: AppColors.furitCicle,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: -8,
                                            child: Image.asset(product.image),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        product.price,
                                        style: AppTextStyles.productPriceStyle,
                                      ),
                                      Text(
                                        product.title,
                                        style: AppTextStyles.productTitlleStyle,
                                      ),
                                      Text(
                                        product.quantity,
                                        style: AppTextStyles.categoryTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Divider(
                                  height: 1,
                                  color: AppColors.inactiveColor,
                                ),
                                const SizedBox(height: 10),
                                if (product.isAddedInCart)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(AppImages.minusIcon),
                                        Text(
                                          "1",
                                          style: AppTextStyles.cartCountStyle,
                                        ),
                                        Image.asset(AppImages.plusIcon),
                                      ],
                                    ),
                                  ),

                                if (!product.isAddedInCart)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppImages.cartIcon),
                                      const SizedBox(width: 5),
                                      Text(
                                        AppStrings.addToCart,
                                        style: AppTextStyles.cartCountStyle,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                color: AppColors.offerContainerColor,
                                child: Text(
                                  AppStrings.newText,
                                  style: AppTextStyles.categoryTitleStyle
                                      .copyWith(color: AppColors.offerTagColor),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: Icon(
                                  product.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                      
                                  color:
                                      product.isFavorite
                                          ? AppColors.favoriteColor
                                          : AppColors.greyTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView productCategories(HomeViewModel viewModel) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(viewModel.categories.length, (index) {
          final category = viewModel.categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: category.bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(category.image),
                  ),
                ),
                const SizedBox(height: 5),
                Text(category.title, style: AppTextStyles.categoryTitleStyle),
              ],
            ),
          );
        }),
      ),
    );
  }
}
