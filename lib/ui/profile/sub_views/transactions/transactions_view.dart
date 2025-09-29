import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/profile/sub_views/transactions/transactions_view_model.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TransactionsViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "Transactions",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView.separated(
        padding: EdgeInsetsGeometry.symmetric(vertical: 25, horizontal: 17),
        itemCount: viewModel.transactions.length,
        separatorBuilder: (_, _) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          final transaction = viewModel.transactions[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 25),
            tileColor: AppColors.whiteColor,
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.greyColor.shade200,
              child: Image.asset(transaction.icon),
            ),
            title: Text(
              transaction.cardName,
              style: AppTextStyles.productTitlleStyle,
            ),
            subtitle: Text(
              transaction.datetime,
              style: AppTextStyles.categoryTitleStyle,
            ),
            trailing: Text(
              "\$${transaction.amount}",
              style: AppTextStyles.productTitlleStyle.copyWith(
                color: AppColors.priceColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
