import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/constants/app_images.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/home_navigation/home_navigation_controller.dart';
import 'package:provider/provider.dart';

class ProfileOptionModel {
  final String icon;
  final String title;

  ProfileOptionModel(this.icon, this.title);
}

class ProfileViewModel extends ChangeNotifier {
  List<ProfileOptionModel> options = [
    ProfileOptionModel(AppImages.aboutMeOption, 'About me'),
    ProfileOptionModel(AppImages.myOrdersOption, 'My Orders'),
    ProfileOptionModel(AppImages.myFavoritesOption, 'My Favorites'),
    ProfileOptionModel(AppImages.myAddressOption, 'My Address'),
    ProfileOptionModel(AppImages.creditCardsOption, 'Credit Cards'),
    ProfileOptionModel(AppImages.transactionsOption, 'Transactions'),
    ProfileOptionModel(AppImages.notificationsOption, 'Notifications'),
    ProfileOptionModel(AppImages.signOutOption, 'Sign Out'),
  ];

  // on tap option
  void onOptionTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.push(AppRoutes.aboutMe);
        break;
      case 1:
        context.push(AppRoutes.myOrders);
        break;
      case 2:
        context.read<HomeNavigationController>().changeIndex(2);
        break;
      case 3:
        context.push(AppRoutes.myAddress);
        break;
      case 4:
        context.push(AppRoutes.creditCards);
        break;
      case 5:
        context.push(AppRoutes.transactions);
        break;
      case 6:
        context.push(AppRoutes.notifications);
        break;
      case 7:
        context.push(AppRoutes.login);
        break;
    }
  }
}
