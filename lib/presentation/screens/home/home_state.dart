part of 'home_bloc.dart';

class HomeState {
  List<CategoryModel>? categories;
  List<BookModel>? books;
  Status? status;

  HomeState({
    this.categories,
    this.books,
    this.status
  });

  HomeState copyWith({
    List<CategoryModel>? categories,
    List<BookModel>? books,
    Status? status
  }) => HomeState(
    categories: categories ?? this.categories,
    books: books ?? this.books,
    status: status ?? this.status
  );
}