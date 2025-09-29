import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/profile/sub_views/my_address/my_address_view_model.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MyAddressViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "My Address",
        context: context,
        backgroundColor: AppColors.whiteColor,
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.addAddress);
            },
            icon: Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 17),
        itemCount: viewModel.addresses.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 19);
        },
        itemBuilder: (context, index) {
          return Consumer<MyAddressViewModel>(
            // selector: (context, viewModel) => viewModel.addresses[index],
            builder: (context, viewModel, child) {
              return MyAddressCard(
                isExpand: viewModel.addresses[index].isExpand,
                makeDefault: viewModel.addresses[index].isDefault,
                onChangedDefault: () {
                  viewModel.toggleDefaultAddress(index);
                },
                onTapHeader: () {
                  viewModel.toggleExpand(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class MyAddressCard extends StatelessWidget {
  const MyAddressCard({
    super.key,
    this.isExpand,
    this.makeDefault = false,
    this.onChangedDefault,
    this.onTapHeader,
  });
  final bool makeDefault;
  final void Function()? onChangedDefault;
  final bool? isExpand;
  final void Function()? onTapHeader;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      color: AppColors.whiteColor,
      child: Column(
        children: [
          MyAddressCardHeader(isExpand: isExpand, onTapHeader: onTapHeader),
          if (isExpand == true) ...[
            Divider(color: AppColors.greyColor.shade200, thickness: 1),
            MyAddressCardFields(
              makeDefault: makeDefault,
              onChangedDefault: onChangedDefault,
            ),
          ],
        ],
      ),
    );
  }
}

class MyAddressCardFields extends StatelessWidget {
  const MyAddressCardFields({
    super.key,
    required this.makeDefault,
    this.onChangedDefault,
  });
  final bool makeDefault;
  final void Function()? onChangedDefault;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(),
            hintText: "Name",
            prefixIcon: Image.asset(AppImages.addressIcon1),
            enabled: false,
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "Address",
            prefixIcon: Image.asset(AppImages.addressIcon2),
            enabled: false,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: TextEditingController(),
                  hintText: "City",
                  prefixIcon: Image.asset(AppImages.addressIcon3),
                  enabled: false,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CustomTextField(
                  controller: TextEditingController(),
                  hintText: "Zip Code",
                  prefixIcon: Image.asset(AppImages.addressIcon4),
                  enabled: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "Country",
            prefixIcon: Image.asset(AppImages.addressIcon5),
            enabled: false,
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "Phone Number",
            prefixIcon: Image.asset(AppImages.addressIcon6),
            enabled: false,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              GestureDetector(
                onTap: onChangedDefault,
                child: Image.asset(
                  makeDefault
                      ? AppImages.switchOnIcon
                      : AppImages.switchOffIcon,
                ),
              ),
              SizedBox(width: 8),
              Text("Make Default", style: AppTextStyles.productTitlleStyle),
            ],
          ),
        ],
      ),
    );
  }
}

class MyAddressCardHeader extends StatelessWidget {
  const MyAddressCardHeader({
    super.key,
    required this.isExpand,
    this.onTapHeader,
  });

  final bool? isExpand;
  final void Function()? onTapHeader;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHeader,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 17),
        color: AppColors.whiteColor,
        child: Row(
          children: [
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                color: AppColors.primaryColorLight,
                shape: BoxShape.circle,
              ),
              child: Center(child: Image.asset(AppImages.myAddressIcon)),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jissca Simpson",
                    style: AppTextStyles.productTitlleStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "2811 Crescent Day. LA Port",
                    style: AppTextStyles.categoryTitleStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "California, United States 77571",
                    style: AppTextStyles.categoryTitleStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "+1  202  555  0142 ",
                    style: AppTextStyles.categoryTitleStyle.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            if (isExpand == null)
              SizedBox()
            else if (isExpand == true)
              Image.asset(AppImages.collapseIcon)
            else
              Image.asset(AppImages.expandIcon),
          ],
        ),
      ),
    );
  }
}
