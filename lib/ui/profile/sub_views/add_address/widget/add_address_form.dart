import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/ui/profile/sub_views/add_address/add_address_view_model.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AddAddressViewModel>();
    return Column(
      children: [
        CustomTextField(
          controller: viewModel.nameController,
          hintText: "Name",
          prefixIcon: Image.asset(AppImages.addressIcon1),
        ),
        const SizedBox(height: 5),
        CustomTextField(
          controller: viewModel.emailController,
          hintText: "Email",
          prefixIcon: Image.asset(AppImages.emailIcon),
        ),
        const SizedBox(height: 5),
        CustomTextField(
          controller: viewModel.phoneController,
          hintText: "Phone Number",
          prefixIcon: Image.asset(AppImages.addressIcon6),
        ),
        const SizedBox(height: 5),
        CustomTextField(
          controller: viewModel.addressController,
          hintText: "Address",
          prefixIcon: Image.asset(AppImages.addressIcon2),
        ),
        const SizedBox(height: 5),
        CustomTextField(
          controller: viewModel.zipCodeController,
          hintText: "Zip Code",
          prefixIcon: Image.asset(AppImages.addressIcon4),
        ),
        const SizedBox(height: 5),
        CustomTextField(
          controller: viewModel.cityController,
          hintText: "City",
          prefixIcon: Image.asset(AppImages.addressIcon3),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              onSelect: (value) {
                viewModel.countryController.text = value.name;
              },
            );
          },
          child: CustomTextField(
            controller: viewModel.countryController,
            hintText: "Country",
            enabled: false,
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              color: AppColors.greyColor.shade200,
            ),
            prefixIcon: Image.asset(AppImages.addressIcon5),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  viewModel.toggleDefault();
                },
                child: Image.asset(
                  context.select<AddAddressViewModel, bool>(
                        (vm) => vm.isDefault,
                      )
                      ? AppImages.switchOnIcon
                      : AppImages.switchOffIcon,
                ),
              ),
              const SizedBox(width: 8),
              const Text("Set as default"),
            ],
          ),
        ),
      ],
    );
  }
}
