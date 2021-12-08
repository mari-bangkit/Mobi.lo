class CategoryData {
  String name;
  CategoryData(this.name);
}

List<CategoryData> categorydata =
    categoryData.map((item) => CategoryData(item['name'])).toList();

List categoryData = [
  {
    "name": "Recommended",
  },
  {
    "name": "Popular",
  },
  {
    "name": "New place",
  },
  {
    "name": "Best place",
  },
];
