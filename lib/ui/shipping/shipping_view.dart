import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/constants/app_text_styles.dart';
import 'package:grocery_app/ui/shipping/shipping_view_model.dart';
import 'package:grocery_app/ui/shipping/widgets/shipping_stepper.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:grocery_app/widgets/appbar_widget.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ShippingView extends StatelessWidget {
  const ShippingView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ShippingViewModel>();
    return Scaffold(
      appBar: appBarWidget(
        title: "Shipping Method",
        context: context,
        backgroundColor: AppColors.whiteColor,
        onBackPressed: () {
          // pop only if page number is 0
          if (viewModel.pageNumber == 1) {
            context.pop();
          } else {
            viewModel.changePageNumber(viewModel.pageNumber - 1);
          }
        },
      ),
      body: Column(
        children: [
          const SizedBox(height: 22),
          ShippingStepper(),
          const SizedBox(height: 20),
          // page view
          Expanded(
            child: PageView.builder(
              itemCount: viewModel.pages.length,
              controller: viewModel.pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: viewModel.pages[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            buttonText: "",
            child: Selector<ShippingViewModel, int>(
              selector: (context, viewModel) => viewModel.pageNumber,
              builder: (context, pageNumber, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Text(
                    pageNumber >= 3 ? "Make a Payment" : "Next",
                    key: ValueKey(pageNumber),
                    style: AppTextStyles.buttonStyle,
                  ),
                );
              },
            ),
            onButtonPressed: () {
              if (viewModel.pageNumber < 3) {
                viewModel.changePageNumber(viewModel.pageNumber + 1);
              } else {
                // place order
              }
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
