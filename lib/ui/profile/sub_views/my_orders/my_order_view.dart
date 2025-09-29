import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/ui/profile/sub_views/my_orders/my_orders_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/my_orders/widgets/my_order_card.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MyOrdersViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "My Orders",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 19, vertical: 20),
        separatorBuilder: (context, index) => SizedBox(height: 9),
        itemCount: viewModel.isExpand.length,
        itemBuilder: (context, index) {
          return MyOrderCard(
            index: index,
            onTap: () {
              viewModel.toggleExpand(index);
            },
          );
        },
      ),
    );
  }
}