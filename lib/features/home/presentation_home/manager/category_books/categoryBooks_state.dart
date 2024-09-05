

import '../../../data/models/books.dart';

class BooksCategoryState {}

final class BooksCategoryInitial extends BooksCategoryState {}
final class BooksCategoryLoading extends BooksCategoryState {}
final class BooksCategorySuccess extends BooksCategoryState {
  final List<Books> books;

  BooksCategorySuccess( {required this.books});
}
final class BooksCategoryFailure extends BooksCategoryState {
  final String error;

  BooksCategoryFailure({required this.error});
}