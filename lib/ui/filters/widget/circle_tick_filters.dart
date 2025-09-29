import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/filters/filters_view_model.dart';
import 'package:provider/provider.dart';

class CircleTickFilters extends StatelessWidget {
  const CircleTickFilters({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDiscount = context.select<FiltersViewModel, bool>((value) => value.isDiscount);
    final freeShipping = context.select<FiltersViewModel, bool>((value) => value.isFreeShipping);
    final sameDayDelivery = context.select<FiltersViewModel, bool>((value) => value.isSameDayDelivery);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Others", style: AppTextStyles.productTitlleStyle),
          ),
          SizedBox(height: 15),
          ListTile(
            onTap: () {
              context.read<FiltersViewModel>().updateIsDiscount(!isDiscount);
            },
            leading: Image.asset(AppImages.discountIcon),
            title: Text(
              "Discount",
              style: AppTextStyles.categoryTitleStyle.copyWith(fontSize: 12),
            ),
            trailing: Image.asset(isDiscount?AppImages.cirlceTickGreenIcon:AppImages.cirlceTickGreyIcon),
          ),
          ListTile(
            onTap: () {
              context.read<FiltersViewModel>().updateIsFreeShipping(!freeShipping);
            },
            leading: Image.asset(AppImages.freeShippingIcon),
            title: Text(
              "Free Shipping",
              style: AppTextStyles.categoryTitleStyle.copyWith(fontSize: 12),
            ),
            trailing: Image.asset(freeShipping?AppImages.cirlceTickGreenIcon:AppImages.cirlceTickGreyIcon),
          ),
          ListTile(
            onTap: () {
              context.read<FiltersViewModel>().updateIsSameDayDelivery(!sameDayDelivery);
            },
            leading: Image.asset(AppImages.deliveryIcon),
            title: Text(
              "Same day delivery",
              style: AppTextStyles.categoryTitleStyle.copyWith(fontSize: 12),
            ),
            trailing: Image.asset(sameDayDelivery?AppImages.cirlceTickGreenIcon:AppImages.cirlceTickGreyIcon),
          ),
        ],
      ),
    );
  }
}
