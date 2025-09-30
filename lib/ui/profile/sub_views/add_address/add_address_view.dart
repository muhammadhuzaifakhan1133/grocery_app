import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/ui/profile/sub_views/add_address/add_address_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/add_address/widget/add_address_form.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: "Add Address",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
        child: SingleChildScrollView(
          child: AddAddressForm(),
        ),
      ),
    );
  }
}