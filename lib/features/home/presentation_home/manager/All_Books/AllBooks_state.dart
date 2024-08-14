

import '../../../data/models/books.dart';

abstract class AllBooksState{}

class AllBooksIntial extends AllBooksState{}

class AllBooksLoading extends AllBooksState{}

class AllBooksSuccess extends AllBooksState{
  final List<Books> books;

  AllBooksSuccess({required this.books});
}


class AllBooksFailure extends AllBooksState{
  final String error;

  AllBooksFailure({required this.error});

}

