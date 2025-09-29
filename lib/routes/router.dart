import 'package:go_router/go_router.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/auth/forgot_password/forgot_password_view.dart';
import 'package:grocery_app/ui/auth/login/login_view.dart';
import 'package:grocery_app/ui/auth/signup/signup_view.dart';
import 'package:grocery_app/ui/auth/welcome/auth_welcome_view.dart';
import 'package:grocery_app/ui/categories/categories_view.dart';
import 'package:grocery_app/ui/category_products/category_products_view.dart';
import 'package:grocery_app/ui/filters/filters_view.dart';
import 'package:grocery_app/ui/home/home_view.dart';
import 'package:grocery_app/ui/home_navigation/home_navigation_view.dart';
import 'package:grocery_app/ui/onboarding/onboarding_view.dart';
import 'package:grocery_app/ui/otp/otp_view.dart';
import 'package:grocery_app/ui/product_detail/product_detail_view.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/add_credit_card_view.dart';
import 'package:grocery_app/ui/profile/sub_views/credit_cards/credit_cards_view.dart';
import 'package:grocery_app/ui/profile/sub_views/notifications/notifications_view.dart';
import 'package:grocery_app/ui/profile/sub_views/about_me/about_me_view.dart';
import 'package:grocery_app/ui/profile/sub_views/add_address/add_address_view.dart';
import 'package:grocery_app/ui/profile/sub_views/my_address/my_address_view.dart';
import 'package:grocery_app/ui/profile/sub_views/my_orders/my_order_view.dart';
import 'package:grocery_app/ui/profile/sub_views/order_detail/order_detail_view.dart';
import 'package:grocery_app/ui/profile/sub_views/transactions/transactions_view.dart';
import 'package:grocery_app/ui/profile/sub_views/transactions/transactions_view_model.dart';
import 'package:grocery_app/ui/reviews/add_review_view.dart';
import 'package:grocery_app/ui/reviews/reviews_view.dart';
import 'package:grocery_app/ui/splash/splash_view.dart';
import 'package:grocery_app/ui/verify_number/verify_number_view.dart';

final router = GoRouter(
  initialLocation: AppRoutes.homeNavigation,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: AppRoutes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      name: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: AppRoutes.welcome,
      name: AppRoutes.welcome,
      builder: (context, state) => const AuthWelcomeView(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      name: AppRoutes.signup,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      name: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: AppRoutes.verifyNumber,
      name: AppRoutes.verifyNumber,
      builder: (context, state) => const VerifyNumberView(),
    ),
    GoRoute(
      path: AppRoutes.otp,
      name: AppRoutes.otp,
      builder: (context, state) => const OtpView(),
    ),
    GoRoute(
      path: AppRoutes.homeNavigation,
      name: AppRoutes.homeNavigation,
      builder: (context, state) => const HomeNavigationView(),
    ),
    GoRoute(
      path: AppRoutes.categories,
      name: AppRoutes.categories,
      builder: (context, state) {
        final categories = state.extra as List<CategoryModel>;
        return CategoriesView(categories: categories);
      },
    ),
    GoRoute(
      path: AppRoutes.categoryProducts,
      name: AppRoutes.categoryProducts,
      builder: (context, state) {
        final categoryTitle = state.uri.queryParameters['title'] as String;
        return CategoryProductsView(categoryTitle: categoryTitle);
      },
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      name: AppRoutes.productDetails,
      builder: (context, state) {
        final product = state.extra as ProductModel;
        final index = int.tryParse(state.uri.queryParameters['index'] ?? '') ?? 0;
        return ProductDetailView(product: product, index: index);
      },
    ),
    GoRoute(
      path: AppRoutes.reviews,
      name: AppRoutes.reviews,
      builder: (context, state) => const ReviewsView(),
    ),
    GoRoute(
      path: AppRoutes.addReview,
      name: AppRoutes.addReview,
      builder: (context, state) => const AddReviewView(),
    ),
    GoRoute(
      path: AppRoutes.filter,
      name: AppRoutes.filter,
      builder: (context, state) => const FiltersView(),
    ),
    GoRoute(
      path: AppRoutes.aboutMe,
      name: AppRoutes.aboutMe,
      builder: (context, state) => const AboutMeView(),
    ),
    GoRoute(
      path: AppRoutes.myOrders,
      name: AppRoutes.myOrders,
      builder: (context, state) => const MyOrdersView(),
    ),
    GoRoute(
      path: AppRoutes.orderDetails,
      name: AppRoutes.orderDetails,
      builder: (context, state) => const OrderDetailView(),
    ),
    GoRoute(
      path: AppRoutes.myAddress,
      name: AppRoutes.myAddress,
      builder: (context, state) => const MyAddressView(),
    ),
    GoRoute(
      path: AppRoutes.addAddress,
      name: AppRoutes.addAddress,
      builder: (context, state) => const AddAddressView(),
    ),
    GoRoute(
      path: AppRoutes.notifications,
      name: AppRoutes.notifications,
      builder: (context, state) => const NotificationsView(),
    ),
    GoRoute(
      path: AppRoutes.transactions,
      name: AppRoutes.transactions,
      builder: (context, state) => const TransactionsView(),
    ),
    GoRoute(
      path: AppRoutes.creditCards,
      name: AppRoutes.creditCards,
      builder: (context, state) => const CreditCardsView(),
    ),
    GoRoute(
      path: AppRoutes.addCreditCards,
      name: AppRoutes.addCreditCards,
      builder: (context, state) => const AddCreditCardView(),
    ),
  ],

  // redirect: (context, state) {
    // Check if the user is authenticated
    // if (!isAuthenticated) {
    //   return '/login'; // Redirect to login if not authenticated
    // }
  // }
);