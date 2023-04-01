class RecommendedModel {
  final String image;
  final String profileImage;
  final String profileName;
  final String drinkName;
  final String itemLeft;
  final String expireDate;
  final String distance;
  final String price;
  final String discount;

  RecommendedModel({
    required this.image,
    required this.profileImage,
    required this.profileName,
    required this.drinkName,
    required this.itemLeft,
    required this.expireDate,
    required this.distance,
    required this.price,
    required this.discount,
  });
}

List<RecommendedModel> recommendedList = [
  RecommendedModel(
    image: 'assets/images/baked.png',
    profileImage: 'assets/images/person1.png',
    profileName: 'Sans Sam',
    drinkName: 'Baked Loaf',
    itemLeft: '(12 Left)',
    expireDate: 'Exp: 03- 10-2023',
    distance: '6 km',
    price: '\$3.99',
    discount: '\$12.00',
  ),
  RecommendedModel(
    image: 'assets/images/chilli.png',
    profileImage: 'assets/images/person2.png',
    profileName: 'Robert Albewrt',
    drinkName: 'Chili Flakes',
    itemLeft: '(12 Left)',
    expireDate: 'Exp: 03- 10-2023',
    distance: '6 km',
    price: '\$3.99',
    discount: '\$12.00',
  ),
];
