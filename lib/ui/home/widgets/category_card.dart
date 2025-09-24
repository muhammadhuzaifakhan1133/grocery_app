import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:grocery_app/routes/router.dart';
import 'package:grocery_app/routes/routes.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutes.categoryProducts,
          queryParameters: {'title': category.title},
        );
      },
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
  }
}
