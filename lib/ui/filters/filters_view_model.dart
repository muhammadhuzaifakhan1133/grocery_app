import 'package:flutter/material.dart';

class FiltersViewModel extends ChangeNotifier {
  double rating = 0.0;
  bool isDiscount = false;
  bool isFreeShipping = false;
  bool isSameDayDelivery = false;
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

  void updateRating(double newRating) {
    rating = newRating;
    notifyListeners();
  }

  void updateIsDiscount(bool newIsDiscount) {
    isDiscount = newIsDiscount;
    notifyListeners();
  }

  void updateIsFreeShipping(bool newIsFreeShipping) {
    isFreeShipping = newIsFreeShipping;
    notifyListeners();
  }

  void updateIsSameDayDelivery(bool newIsSameDayDelivery) {
    isSameDayDelivery = newIsSameDayDelivery;
    notifyListeners();
  }

  void clearFilters() {
    rating = 0.0;
    isDiscount = false;
    isFreeShipping = false;
    isSameDayDelivery = false;
    minPriceController.clear();
    maxPriceController.clear();
    notifyListeners();
  }
}