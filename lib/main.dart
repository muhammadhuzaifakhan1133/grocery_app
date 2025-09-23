import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_colors.dart';
import 'package:grocery_app/routes/router.dart';
import 'package:grocery_app/ui/auth/forgot_password/forgot_password_view_model.dart';
import 'package:grocery_app/ui/auth/login/login_view.dart';
import 'package:grocery_app/ui/auth/login/login_view_model.dart';
import 'package:grocery_app/ui/auth/signup/signup_view_model.dart';
import 'package:grocery_app/ui/home/home_view.dart';
import 'package:grocery_app/ui/home/home_view_model.dart';
import 'package:grocery_app/ui/onboarding/onboarding_view_model.dart';
import 'package:grocery_app/ui/otp/otp_view_model.dart';
import 'package:grocery_app/ui/splash/splash_view.dart';
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
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      // child: MaterialApp(
      //   home: HomeView(),
      //   debugShowCheckedModeBanner: false,
      //   theme: ThemeData(
      //     scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      //   ),
      // ),
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
