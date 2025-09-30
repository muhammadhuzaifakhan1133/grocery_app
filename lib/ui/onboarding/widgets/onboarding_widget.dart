// import 'package:flutter/material.dart';
// import 'package:grocery_app/constants/app_strings.dart';
// import 'package:grocery_app/constants/app_text_styles.dart';
// import 'package:grocery_app/models/onboarding_data.dart';
// import 'package:grocery_app/constants/app_colors.dart';
// import 'package:grocery_app/utils/custom_ui_clippers.dart';
// import 'package:grocery_app/utils/extensions.dart';
// import 'package:grocery_app/widgets/backgrond_stacked_image.dart';
// import 'package:grocery_app/widgets/custom_button.dart';

// class OnboardingWidget extends StatelessWidget {
//   final OnboardingDataModel data;
//   final int currentIndex;
//   final int totalPages;
//   final Function() onButtonPressed;
//   const OnboardingWidget({
//     super.key,
//     required this.data,
//     required this.currentIndex,
//     required this.totalPages,
//     required this.onButtonPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: context.width,
//         height: context.height * 0.65,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(data.imagePath),
//             fit: BoxFit.cover,
//           ),
//         ),
//       );
//   }
// }
