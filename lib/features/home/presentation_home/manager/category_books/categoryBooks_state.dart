

import '../../../data/models/books.dart';

class BooksCategoryState {}

final class BooksCategoryInitial extends BooksCategoryState {}
final class BooksCategoryLoading extends BooksCategoryState {}
final class BooksCategorySuccess extends BooksCategoryState {
  final List<Books> Book;

  BooksCategorySuccess(this.Book);
}
final class BooksCategoryFailure extends BooksCategoryState {
  final String error;

  BooksCategoryFailure(this.error);
}