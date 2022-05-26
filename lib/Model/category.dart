class CategoryData {
  String name;
  CategoryData(this.name);
}

List<CategoryData> categorydata =
    categoryData.map((item) => CategoryData(item['name'])).toList();

List categoryData = [
  {
    "name": "TOYOTA",
  },
  {
    "name": "HONDA",
  },
  {
    "name": "MITSUBISHI",
  },
  {
    "name": "NISSAN",
  },
  {
    "name": "ISUZU",
  },
];
