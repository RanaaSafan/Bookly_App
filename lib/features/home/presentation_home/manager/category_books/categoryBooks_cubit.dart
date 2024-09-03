
import 'package:bloc/bloc.dart';
import 'package:booky_app/features/home/presentation_home/manager/category_books/categoryBooks_state.dart';


import '../../../data/repo/home_repo.dart';




class BooksCategoryCubit extends Cubit<BooksCategoryState> {
  final HomeRepo homeRepo;
  final String category;

  BooksCategoryCubit(this.homeRepo, this.category) : super(BooksCategoryInitial());

  Future<void> FetchCategoryBooks() async {
    emit(BooksCategoryLoading());
    final result = await homeRepo.FetchCategoryBooks(category);
    result.fold(
          (failure) => emit(BooksCategoryFailure(failure.error)),
          (products) => emit(BooksCategorySuccess(products)),
    );
  }
}