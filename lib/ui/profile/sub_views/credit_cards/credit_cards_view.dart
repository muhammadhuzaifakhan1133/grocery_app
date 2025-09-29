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

class CreditCardsView extends StatelessWidget {
  const CreditCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MyAddressViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "My Cards",
        context: context,
        backgroundColor: AppColors.whiteColor,
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.addCreditCards);
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
              return MyCreditCard(
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

class MyCreditCard extends StatelessWidget {
  const MyCreditCard({
    super.key,
    required this.isExpand,
    required this.makeDefault,
    required this.onChangedDefault,
    required this.onTapHeader,
  });

  final bool isExpand;
  final bool makeDefault;
  final VoidCallback onChangedDefault;
  final VoidCallback onTapHeader;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      color: AppColors.whiteColor,
      child: Stack(
        children: [
          Column(
            children: [
              MyCreditCardHeader(isExpand: isExpand, onTapHeader: onTapHeader),
              if (isExpand == true) ...[
                Divider(color: AppColors.greyColor.shade200, thickness: 1),
                MyCreditCardFeilds(
                  makeDefault: makeDefault,
                  onChangedDefault: onChangedDefault,
                ),
              ],
            ],
          ),
          if (makeDefault)
            Container(
              color: AppColors.primaryColorLight,
              padding: EdgeInsets.all(5),
              child: Text(
                "DEFAULT",
                style: AppTextStyles.categoryTitleStyle.copyWith(
                  color: AppColors.priceColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MyCreditCardFeilds extends StatelessWidget {
  const MyCreditCardFeilds({
    super.key,
    required this.makeDefault,
    required this.onChangedDefault,
  });

  final bool makeDefault;
  final VoidCallback onChangedDefault;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(),
            enabled: false,
            prefixIcon: Image.asset(AppImages.cardIcon2, height: 60, width: 60),
            hintText: "Russell Austin",
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: TextEditingController(),
            enabled: false,
            prefixIcon: Image.asset(AppImages.cardIcon),
            hintText: "XXXX  XXXX  XXXX  5678",
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: TextEditingController(),
                  enabled: false,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(AppImages.cardIcon3),
                  ),
                  hintText: "01/22",
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CustomTextField(
                  controller: TextEditingController(),
                  enabled: false,
                  prefixIcon: Image.asset(AppImages.cardIcon4),
                  hintText: "908",
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
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

class MyCreditCardHeader extends StatelessWidget {
  const MyCreditCardHeader({
    super.key,
    required this.isExpand,
    required this.onTapHeader,
  });

  final bool isExpand;
  final VoidCallback onTapHeader;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHeader,
      child: Container(
        color: AppColors.whiteColor,
        padding: EdgeInsets.only(top: 34, bottom: 26, left: 19, right: 19),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.greyColor.shade200,
              child: Image.asset(AppImages.masterCard),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Master Card", style: AppTextStyles.productTitlleStyle),
                  Text(
                    "XXXX  XXXX  XXXX  5678",
                    style: AppTextStyles.categoryTitleStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Expiry ",
                      style: AppTextStyles.categoryTitleStyle.copyWith(
                        color: AppColors.blackColor,
                      ),
                      children: [
                        TextSpan(
                          text: ": 01/22\t\t\t\t",
                          style: AppTextStyles.categoryTitleStyle.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "CVV ",
                          style: AppTextStyles.categoryTitleStyle.copyWith(
                            color: AppColors.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: ": 908",
                          style: AppTextStyles.categoryTitleStyle.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isExpand == true)
              Image.asset(AppImages.collapseIcon)
            else
              Image.asset(AppImages.expandIcon),
          ],
        ),
      ),
    );
  }
}
