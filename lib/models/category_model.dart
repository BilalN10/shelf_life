class CategoryModel {
  final String title;
  bool isCategorySelect;
  CategoryModel({
    required this.title,
    this.isCategorySelect = false,
  });
}

List<CategoryModel> categoryList = [
  CategoryModel(title: 'Fish'),
  CategoryModel(title: 'Fruits'),
  CategoryModel(title: 'Coffee'),
  CategoryModel(title: 'Meat'),
  CategoryModel(title: 'Drinks'),
  CategoryModel(title: 'Dairy'),
  CategoryModel(title: 'Snacks'),
  CategoryModel(title: 'Soup'),
  CategoryModel(title: 'Fries'),
  CategoryModel(title: 'Sushi'),
  CategoryModel(title: 'Soda'),
];
