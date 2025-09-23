import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:grocery_app/ui/home/widgets/category_card.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context: context,
        title: 'Categories',
        backgroundColor: AppColors.whiteColor,
        actions: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.only(right: 10),
            icon: Image.asset(AppImages.blackFilterIcon),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.whiteColor,

            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CategoryCard(category: categories[index]),
            ),
          );
        },
      ),
    );
  }
}
