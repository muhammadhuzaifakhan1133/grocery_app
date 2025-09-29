import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/ui/cart/cart_view.dart';
import 'package:grocery_app/ui/favorites/favorites_view.dart';
import 'package:grocery_app/ui/home/home_view.dart';
import 'package:grocery_app/ui/home_navigation/home_navigation_controller.dart';
import 'package:grocery_app/ui/profile/profile/profile_view.dart';
import 'package:provider/provider.dart';

class HomeNavigationView extends StatelessWidget {
  const HomeNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeNavigationController>();
    return Scaffold(
      body: IndexedStack(
        index: viewModel.currentIndex,
        children: [
          // Replace the Containers with your actual views
          HomeView(),
          CartView(),
          FavoritesView(),
          ProfileView(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(height: 55, color: AppColors.whiteColor),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(viewModel.icons.length, (index) {
                if (viewModel.currentIndex == index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryDarkColor,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: Center(
                      child: Icon(
                        viewModel.icons[index],
                        color: AppColors.whiteColor,
                        size: 30,
                      ),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      viewModel.changeIndex(index);
                    },
                    child: Icon(viewModel.icons[index]),
                  );
                }
              }),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor: AppColors.greyTextColor,
      //   selectedItemColor: AppColors.blackColor,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   currentIndex: viewModel.currentIndex,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (index) {
      //     viewModel.changeIndex(index);
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon:
      //           viewModel.currentIndex == 0
      //               ? CircleAvatar(
      //                 backgroundColor: AppColors.primaryDarkColor,
      //                 radius: 50,
      //                 child: Icon(Icons.home, color: AppColors.whiteColor),
      //               )
      //               : Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_bag_outlined),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_border),
      //       label: 'Favorites',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}
