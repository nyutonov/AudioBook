class BookModel {
  String? id;
  String? name;
  String? bookName;
  String? author;
  String? image;
  String? categoryId;

  BookModel({
    required this.id,
    required this.name,
    required this.bookName,
    required this.author,
    required this.image,
    required this.categoryId
  });

  BookModel.fromJson(Map<String, dynamic> json, String id) {
    id = id;

    name = json['name'];
    bookName = json['book_name'];
    author = json['author'];
    image = json['image'];
    categoryId = json['category_id'];
  }
}