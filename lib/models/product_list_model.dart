class ProductModelList {
  final String image;
  final String name;
  final String expiryDate;
  final String price;

  ProductModelList({
    required this.image,
    required this.name,
    required this.expiryDate,
    required this.price,
  });
}

List<ProductModelList> productList = [
  ProductModelList(
    image: 'assets/images/tomatosoup.png',
    name: 'Tomato Soup',
    expiryDate: 'Expire Date: 03- 10-2023',
    price: '\$3.99',
  ),
  ProductModelList(
    image: 'assets/images/pastasouce.png',
    name: 'Pasta Souce',
    expiryDate: 'Expire Date: 03- 10-2023',
    price: '\$3.99',
  ),
  ProductModelList(
    image: 'assets/images/softdrinks.png',
    name: 'Soft Drinks',
    expiryDate: 'Expire Date: 03- 10-2023',
    price: '\$3.99',
  ),
  ProductModelList(
    image: 'assets/images/snacks.png',
    name: 'Snacks',
    expiryDate: 'Expire Date: 03- 10-2023',
    price: '\$3.99',
  ),
];
