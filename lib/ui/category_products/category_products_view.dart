import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/product_grid_view.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class CategoryProductsView extends StatelessWidget {
  final String categoryTitle;

  const CategoryProductsView({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        context: context,
        title: categoryTitle,
        backgroundColor: AppColors.whiteColor,
        actions: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.only(right: 10),
            icon: Image.asset(AppImages.blackFilterIcon),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ProductGridView(viewModel: viewModel),
      ),
    );
  }
}
