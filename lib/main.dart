import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/routes/router.dart';
import 'package:grocery_app/ui/auth/forgot_password/forgot_password_view_model.dart';
import 'package:grocery_app/ui/auth/login/login_view_model.dart';
import 'package:grocery_app/ui/auth/signup/signup_view_model.dart';
import 'package:grocery_app/ui/cart/cart_view_model.dart';
import 'package:grocery_app/ui/favorites/favorites_view_model.dart';
import 'package:grocery_app/ui/filters/filters_view_model.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/home_navigation/home_navigation_controller.dart';
import 'package:grocery_app/ui/onboarding/onboarding_view_model.dart';
import 'package:grocery_app/ui/otp/otp_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/add_credit_card_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/credit_cards/credit_cards_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/notifications/notifications_view_model.dart';
import 'package:grocery_app/ui/profile/profile/profile_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/about_me/about_me_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/add_address/add_address_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/my_address/my_address_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/my_orders/my_orders_view_model.dart';
import 'package:grocery_app/ui/profile/sub_views/transactions/transactions_view_model.dart';
import 'package:grocery_app/ui/reviews/reviews_vew_model.dart';
import 'package:grocery_app/ui/search/search_view_model.dart';
import 'package:grocery_app/ui/shipping/shipping_view.dart';
import 'package:grocery_app/ui/shipping/shipping_view_model.dart';
import 'package:grocery_app/ui/verify_number/verify_number_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => VerifyNumberViewModel()),
        ChangeNotifierProvider(create: (_) => OtpViewModel()),
        ChangeNotifierProvider(create: (_) => ReviewsVewModel()),
        ChangeNotifierProvider(create: (_) => FavoritesViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (_) => HomeNavigationController()),
        ChangeNotifierProxyProvider2<FavoritesViewModel, CartViewModel, HomeViewModel>(
          create: (_) => HomeViewModel(),
          update: (_, favorites, cart, home) {
            home!.favoriteModel = favorites;
            home.cartModel = cart;
            return home;
          },
        ),
        ChangeNotifierProvider(create: (_) => FiltersViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => AboutMeViewModel()),
        ChangeNotifierProvider(create: (_) => MyOrdersViewModel()),
        ChangeNotifierProvider(create: (_) => MyAddressViewModel()),
        ChangeNotifierProvider(create: (_) => AddAddressViewModel()),
        ChangeNotifierProvider(create: (_) => NotificationsViewModel()),
        ChangeNotifierProvider(create: (_) => TransactionsViewModel()),
        ChangeNotifierProvider(create: (_) => CreditCardsViewModel()),
        ChangeNotifierProvider(create: (_) => AddCreditCardViewModel()),
        ChangeNotifierProvider(create: (_) => SearchViewModel()),
        ChangeNotifierProvider(create: (_) => ShippingViewModel()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
