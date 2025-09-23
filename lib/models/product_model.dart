class ProductModel {
  final String image;
  final String title;
  final String price;
  final String availableQty;
  final bool isAddedInCart;
  final bool isFavorite;
  final int quantity;

  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.availableQty,
    required this.isAddedInCart,
    this.isFavorite = false,
    this.quantity = 1,
  });
}