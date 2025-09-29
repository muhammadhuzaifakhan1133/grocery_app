import 'package:flutter/material.dart';
import 'package:grocery_app/constants/app_images.dart';

class TransactionModel {
  final String icon;
  final String cardName;
  final String datetime;
  final double amount;

  TransactionModel({
    required this.icon,
    required this.cardName,
    required this.datetime,
    required this.amount,
  });
}

class TransactionsViewModel extends ChangeNotifier {
  List<TransactionModel> transactions = [
    TransactionModel(
      icon: AppImages.masterCard,
      cardName: 'Mastercard',
      datetime: 'Dec 12 2021 at 10:00 pm',
      amount: 89,
    ),
    TransactionModel(
      icon: AppImages.visaCard,
      cardName: 'Visa Card',
      datetime: 'Dec 12 2021 at 10:00 pm',
      amount: 109,
    ),
    TransactionModel(
      icon: AppImages.paypal,
      cardName: 'Paypal',
      datetime: 'Dec 12 2021 at 10:00 pm',
      amount: 567,
    ),
    TransactionModel(
      icon: AppImages.paypal,
      cardName: 'Paypal',
      datetime: 'Dec 12 2021 at 10:00 pm',
      amount: 567,
    ),
    TransactionModel(
      icon: AppImages.visaCard,
      cardName: 'Visa Card',
      datetime: 'Dec 12 2021 at 10:00 pm',
      amount: 109,
    ),
    TransactionModel(
      icon: AppImages.masterCard,
      cardName: 'Mastercard',
      datetime: 'Dec 12 2021 at 10:00 pm',
      amount: 89,
    ),
  ];
}
