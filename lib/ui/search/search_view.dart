import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/search/search_view_model.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        leadingWidth: 30,
        toolbarHeight: 80,
        backgroundColor: AppColors.whiteColor,
        title: CustomTextField(
          controller: TextEditingController(),
          hintText: "Search Keywords...",
          prefixIcon: const Icon(Icons.search),
          fillColor: AppColors.scaffoldBackgroundColor,
          suffixIcon: GestureDetector(
            onTap: () {
              context.push(AppRoutes.filter);
            },
            child: Image.asset(AppImages.filterIcon),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            searchOptions(
              title: "Search History",
              onClear: () {},
              options: viewModel.history,
            ),
            const SizedBox(height: 30),
            searchOptions(
              title: "Discover More",
              onClear: () {},
              options: viewModel.history,
            ),
          ],
        ),
      ),
    );
  }

  Column searchOptions({
    required String title,
    required Function() onClear,
    required List<String> options,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.appBarTitleStyle),
            TextButton(
              onPressed: onClear,
              child: Text(
                "clear",
                style: AppTextStyles.cartCountStyle.copyWith(
                  color: AppColors.linkColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var h in options)
                Chip(
                  label: Text(h),
                  labelStyle: AppTextStyles.categoryTitleStyle,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
