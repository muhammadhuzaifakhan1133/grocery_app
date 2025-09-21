import 'package:go_router/go_router.dart';
import 'package:grocery_app/routes/routes.dart';
import 'package:grocery_app/ui/auth/forgot_password/forgot_password_view.dart';
import 'package:grocery_app/ui/auth/login/login_view.dart';
import 'package:grocery_app/ui/auth/signup/signup_view.dart';
import 'package:grocery_app/ui/auth/welcome/auth_welcome_view.dart';
import 'package:grocery_app/ui/onboarding/onboarding_view.dart';
import 'package:grocery_app/ui/otp/otp_view.dart';
import 'package:grocery_app/ui/splash/splash_view.dart';
import 'package:grocery_app/ui/verify_number/verify_number_view.dart';

final router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const AuthWelcomeView(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: AppRoutes.verifyNumber,
      builder: (context, state) => const VerifyNumberView(),
    ),
    GoRoute(
      path: AppRoutes.otp,
      builder: (context, state) => const OtpView(),
    ),
  ],

  // redirect: (context, state) {
    // Check if the user is authenticated
    // if (!isAuthenticated) {
    //   return '/login'; // Redirect to login if not authenticated
    // }
  // }
);