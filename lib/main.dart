import 'package:flutter/material.dart';
import 'package:grocery_app/ui/onboarding/onboarding_screen.dart';
import 'package:grocery_app/ui/onboarding/onboarding_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => OnboardingViewModel())],
      child: MaterialApp(
        home: OnboardingScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
