import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/profile/sub_views/notifications/notifications_view_model.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotificationsViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "Notifications",
        context: context,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 33, horizontal: 17),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildNotificationOptionCard(
                title: "Allow Notifcations",
                desciption:
                    "Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym",
                switchValue: viewModel.allowNotification,
                onSwitchChanged: viewModel.toggleAllowNotification,
              ),
              const SizedBox(height: 12),
              _buildNotificationOptionCard(
                title: "Email Notifcations",
                desciption:
                    "Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym",
                switchValue: viewModel.emailNotification,
                onSwitchChanged: viewModel.toggleEmailNotification,
              ),
              const SizedBox(height: 12),
              _buildNotificationOptionCard(
                title: "Order Notifcations",
                desciption:
                    "Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym",
                switchValue: viewModel.orderNotification,
                onSwitchChanged: viewModel.toggleOrderNotification,
              ),
              const SizedBox(height: 12),
              _buildNotificationOptionCard(
                title: "General Notifcations",
                desciption:
                    "Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym",
                switchValue: viewModel.generalNotification,
                onSwitchChanged: viewModel.toggleGeneralNotification,
              ),
              SizedBox(height: context.height * 0.05),
              CustomButton(buttonText: "Save Settings"),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildNotificationOptionCard({
    required String title,
    required String desciption,
    required bool switchValue,
    required void Function() onSwitchChanged,
  }) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.only(top: 19, bottom: 10, left: 17, right: 17),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.productTitlleStyle),
                const SizedBox(height: 13),
                Text(desciption, style: AppTextStyles.categoryTitleStyle),
              ],
            ),
          ),
          GestureDetector(
            onTap: onSwitchChanged,
            child: Image.asset(
              switchValue ? AppImages.switchOnIcon : AppImages.switchOffIcon,
            ),
          ),
        ],
      ),
    );
  }
}
