import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/profile/sub_views/my_orders/my_orders_view_model.dart';
import 'package:provider/provider.dart';

class MyOrderCard extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  const MyOrderCard({super.key, required this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isExpand = context.select<MyOrdersViewModel, bool>(
      (vm) => vm.isExpand[index],
    );
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      color: AppColors.whiteColor,
      child: Column(
        children: [
          MyOrderCardHeader(onTap: onTap, isExpand: isExpand),
          if (isExpand) ...[
            Divider(),
            InkWell(
              onTap: () {
                context.push(AppRoutes.orderDetails);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 21),
                child: Column(
                  children: [
                    _buildStep(
                      title: "Order Placed",
                      date: "Oct 19 2021",
                      isCompleted: true,
                      showIndicatorLine: false,
                    ),
                    _buildStep(
                      title: "Order Confirmed",
                      date: "Oct 20 2021",
                      isCompleted: true,
                    ),
                    _buildStep(
                      title: "Order Shipped",
                      date: "Oct 20 2021",
                      isCompleted: true,
                    ),
                    _buildStep(
                      title: "Out for Delivery",
                      date: "Pending",
                      isCompleted: false,
                    ),
                    _buildStep(
                      title: "Order Delivered",
                      date: "Pending",
                      isCompleted: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  _buildStep({
    required String title,
    required String date,
    required bool isCompleted,
    bool showIndicatorLine = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            if (showIndicatorLine)
              Container(
                width: 2,
                height: 30,
                color:
                    isCompleted
                        ? AppColors.primaryDarkColor
                        : AppColors.greyColor.shade500,
              ),
            Icon(
              Icons.circle,
              color:
                  isCompleted
                      ? AppColors.primaryDarkColor
                      : AppColors.greyColor.shade500,
              size: 14,
            ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(title, style: AppTextStyles.cartCountStyle)),
        Text(
          date,
          style: AppTextStyles.categoryTitleStyle.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}

class MyOrderCardHeader extends StatelessWidget {
  const MyOrderCardHeader({
    super.key,
    required this.onTap,
    this.isExpand,
    this.icon,
  });
  final String? icon;
  final void Function()? onTap;
  final bool? isExpand;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 21),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                color: AppColors.primaryColorLight,
                shape: BoxShape.circle,
              ),
              child: Center(child: Image.asset(icon ?? AppImages.myOrderIcon)),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order #90897", style: AppTextStyles.productTitlleStyle),
                  SizedBox(height: 5),
                  Text(
                    "Placed on Octobar 19 2021",
                    style: AppTextStyles.categoryTitleStyle,
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      text: "Items: ",
                      style: AppTextStyles.categoryTitleStyle.copyWith(
                        color: AppColors.blackColor,
                      ),
                      children: [
                        TextSpan(
                          text: "3\t\t\t",
                          style: AppTextStyles.categoryTitleStyle.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Price: ",
                          style: AppTextStyles.categoryTitleStyle.copyWith(
                            color: AppColors.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: "\$15.80",
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
