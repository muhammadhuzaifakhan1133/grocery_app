import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/add_credit_card_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/widgets/add_credit_card_form.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class AddCreditCardView extends StatelessWidget {
  const AddCreditCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: "Add Credit Card",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 30),
        child: SingleChildScrollView(
          child: AddCreditCardForm(),
        ),
      ),
    );
  }

  }