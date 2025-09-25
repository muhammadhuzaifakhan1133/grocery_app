import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/ui/home/home_view.dart';
import 'package:grocery_app/ui/home_navigation/home_navigation_controller.dart';
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
          Center(child: Text('Cart Page')),
          Center(child: Text('Favorites Page')),
          Center(child: Text('Profile Page')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.greyTextColor,
        selectedItemColor: AppColors.blackColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: viewModel.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          viewModel.changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
