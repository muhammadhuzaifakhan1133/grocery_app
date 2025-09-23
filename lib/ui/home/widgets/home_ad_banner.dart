import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/utils/extensions.dart';
import 'package:provider/provider.dart';

class HomeAdBanner extends StatelessWidget {
  const HomeAdBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return Container(
      height: context.height * 0.3,
      color: Colors.red,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: 4,
            controller: viewModel.pageController,
            onPageChanged: (index) {
              viewModel.setCurrentAdIndex(index);
            },
            itemBuilder: (context, index) {
              // replace with actual images later
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(viewModel.adBanners[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          // indicators
          Positioned(
            bottom: 20,
            left: 10,
            child: Selector<HomeViewModel, int>(
              selector: (_, vm) => vm.currentAdBannerIndex,
              builder: (context, currentAdBannerIndex, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < 4; i++)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: currentAdBannerIndex == i ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color:
                              currentAdBannerIndex == i
                                  ? AppColors.primaryDarkColor
                                  : AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(
                            currentAdBannerIndex == i
                                ? 5
                                : 4, // 4 creates a circle-like appearance
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
