import '../../../data/models/books.dart';

abstract class BestsellerState{}

class BestsellerIntial extends BestsellerState{}

class BestsellerLoading extends BestsellerState{}

class BestsellerSuccess extends BestsellerState{
  final List<Books> books;

  BestsellerSuccess({required this.books});
}


class BestsellerFailure extends BestsellerState{
  final String error;

  BestsellerFailure({required this.error});

}