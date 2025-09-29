import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/ui/favorites/dismissible_product_card.dart';
import 'package:grocery_app/ui/favorites/favorites_view_model.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<FavoritesViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        showBackButton: false,
        title: "Favorites",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView.builder(
        itemCount: viewModel.favoriteProducts.length,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        itemBuilder: (context, index) {
          final product = viewModel.favoriteProducts[index];
          return DismissibleProductCard(
            product: product,
            onDismissed: (_) => viewModel.toggleFavorite(product),
            inFavoriteScreen: true,
            cardKey: Key(index.toString()),
          );
        },
      ),
    );
  }
}
