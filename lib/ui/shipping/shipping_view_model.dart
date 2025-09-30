import 'package:flutter/material.dart';
import 'package:grocery_app/ui/profile/sub_views/add_address/widget/add_address_form.dart';
import 'package:grocery_app/ui/profile/sub_views/add_credit_card/widgets/add_credit_card_form.dart';
import 'package:grocery_app/ui/shipping/sub_views/delivery_step1.dart';
import 'package:grocery_app/ui/shipping/sub_views/payment_step3.dart';

class ShippingViewModel extends ChangeNotifier {
  int pageNumber = 1;
  PageController pageController = PageController();
  List<Widget> pages = [
    DeliveryStep1(),
    AddAddressForm(),
    PaymentStep3(),
  ];

  void changePageNumber(int value) {
    pageNumber = value;
    pageController.animateToPage(
      value - 1,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}
