class CategoryModel {
  final String title;
  bool isCategorySelect;
  CategoryModel({
    required this.title,
    this.isCategorySelect = false,
  });
}

List<CategoryModel> categoryList = [
  CategoryModel(title: 'Dairy'),
  CategoryModel(title: 'Baked'),
  CategoryModel(title: 'Snacks'),
  CategoryModel(title: 'Desserts'),
  CategoryModel(title: 'Drinks'),
  CategoryModel(title: 'Sides'),
];
