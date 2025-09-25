import 'package:flutter/widgets.dart';
import 'package:grocery_app/constants/app_images.dart';

class ReviewsVewModel extends ChangeNotifier {

  double currentRating = 0;

  void changeRating(double rating) {
    currentRating = rating;
    notifyListeners();
  }

  List<Review> reviews = [
    Review(
      name: "John Doe",
      profileImage: AppImages.reviewPerson1,
      reviewText:
          "Great product! Highly recommend it. The quality is top-notch and the price is unbeatable.",
      rating: 4.5,
      date: "2023-10-01",
    ),
    Review(
      name: "Jane Smith",
      profileImage: AppImages.reviewPerson2,
      reviewText:
          "Good quality, but a bit expensive. Will buy again. The delivery was prompt and the packaging was excellent.",
      rating: 4.0,
      date: "2023-09-28",
    ),
    Review(
      name: "Alice Johnson",
      profileImage: AppImages.reviewPerson3,
      // more content
      reviewText:
          "Not satisfied with the product. Could be better. The packaging was damaged and the item arrived late. Will not buy again.",
      rating: 2.5,
      date: "2023-09-25",
    ),
    Review(
      name: "Bob Brown",
      profileImage: AppImages.reviewPerson4,
      reviewText:
          "Excellent value for money. Exceeded my expectations. The product works as described and the customer service was very helpful.",
      rating: 5.0,
      date: "2023-09-20",
    ),
  ];
}

class Review {
  final String name;
  final String profileImage;
  final String reviewText;
  final double rating;
  final String date;

  Review({
    required this.name,
    required this.profileImage,
    required this.reviewText,
    required this.rating,
    required this.date,
  });
}
