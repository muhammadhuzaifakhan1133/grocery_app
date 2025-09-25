import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home/widgets/home_view_widgets.dart';
import 'package:grocery_app/ui/home/widgets/product_square_card.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:provider/provider.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      // This delegate is more responsive as it adapts the number of columns
      // based on the available width.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // Define the maximum width of each item. The grid will automatically
        // fit as many as possible per row.
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        // A fixed aspect ratio ensures cards don't get stretched or squeezed.
        // 0.75 means the height is 1.33 times the width (4:3 aspect ratio),
        // which is a good fit for this card design.
        childAspectRatio: context.isPortrait ? 0.68 : 0.85,
      ),
      itemCount: viewModel.featuredProducts.length,
      itemBuilder: (context, index) {
        return Selector<HomeViewModel, ProductModel>(
          selector: (context, viewModel) => viewModel.featuredProducts[index],
          builder: (context, product, child) {
            return ProductSquareCard(
              viewModel: viewModel,
              index: index,
              product: product,
            );
          },
        );
      },
    );
  }
}
