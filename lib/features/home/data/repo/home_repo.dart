
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failers.dart';
import '../models/books.dart';

abstract class HomeRepo{
  Future<Either<Failers,List<Books>>> FetchAllBooks();
  Future<Either<Failers,List<Books>>>  FetchNewestBooks();
  Future<Either<Failers,List<Books>>>  FetchCategoryBooks(String category);


}