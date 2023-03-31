class FoodPrefrenceModel {
  final String image;
  final String name;
  bool isSelect;
  FoodPrefrenceModel({
    required this.image,
    required this.name,
    this.isSelect = false,
  });
}

List<FoodPrefrenceModel> foodList = [
  FoodPrefrenceModel(
    image: 'assets/icons/fish.png',
    name: 'Fish',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/fruits.png',
    name: 'Fruits',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/coffee.png',
    name: 'Coffee',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/meat.png',
    name: 'Meat',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/drinks.png',
    name: 'Drinks',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/dairy.png',
    name: 'Dairy',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/snacks.png',
    name: 'Snacks',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/chicken.png',
    name: 'Chicken',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/soup.png',
    name: 'Soup',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/fries.png',
    name: 'Fries',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/sushi.png',
    name: 'Sushi',
  ),
  FoodPrefrenceModel(
    image: 'assets/icons/soda.png',
    name: 'Soda',
  ),
];
