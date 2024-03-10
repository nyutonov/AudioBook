class CategoryModel {
  String? id;
  String? name;

  CategoryModel({
    required this.id,
    required this.name
  });

  CategoryModel.fromJson(Map<String, dynamic> json, String id) {
    id = id;

    name = json['name'];
  }
}