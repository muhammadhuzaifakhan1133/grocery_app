import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/profile/sub_views/my_orders/widgets/my_order_card.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: "Track Order",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyOrderCardHeader(onTap: () {}, icon: AppImages.myOrderIcon2),
              const SizedBox(height: 19),
              Container(
                color: AppColors.whiteColor,
                padding: EdgeInsets.only(left: 28, top: 19, bottom: 19),
                child: Column(
                  children: [
                    _buildStatusContainer(
                      title: "Order Placed",
                      date: "Placed on Octobar 19 2021",
                      icon: AppImages.myOrderIcon,
                      isCompleted: true,
                    ),
                    _buildStatusContainer(
                      title: "Order Confirmed",
                      date: "Placed on Octobar 19 2021",
                      icon: AppImages.orderConfirmIcon,
                      isCompleted: true,
                    ),
                    _buildStatusContainer(
                      title: "Order Shipped",
                      date: "Placed on Octobar 19 2021",
                      icon: AppImages.orderShippedIcon,
                      isCompleted: true,
                    ),
                    _buildStatusContainer(
                      title: "Out for Delivery",
                      date: "Pending",
                      icon: AppImages.outForDeliveryIcon,
                      isCompleted: false,
                    ),
                    _buildStatusContainer(
                      title: "Order Delivered",
                      date: "Pending",
                      icon: AppImages.orderDeliveredIcon,
                      isCompleted: false,
                      showIndicatorLine: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildStatusContainer({
    required String title,
    required String date,
    required String icon,
    required bool isCompleted,
    bool showIndicatorLine = true,
  }) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                color:
                    isCompleted
                        ? AppColors.primaryColorLight
                        : AppColors.greyColor.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(child: Image.asset(icon)),
            ),
            if (showIndicatorLine)
              Container(
                width: 1,
                height: 40,
                color: AppColors.greyColor.shade200,
              ),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.productTitlleStyle),
              SizedBox(height: 5),
              Text(date, style: AppTextStyles.categoryTitleStyle),
              const SizedBox(height: 15),
              if (showIndicatorLine)
                Divider(color: AppColors.greyColor.shade200, thickness: 1),
            ],
          ),
        ),
      ],
    );
  }
}
