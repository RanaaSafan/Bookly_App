import 'package:bloc/bloc.dart';

import '../../../data/models/category.dart';
import '../../../data/repo/home_repo_impl.dart';
import 'categoryBooks_state.dart';

class BooksCategoryCubit extends Cubit<BooksCategoryState> {
  final HomeRepoImpl _homeRepoImpl;
  final String categoryName;
  final Category category; // Add the category property

  BooksCategoryCubit(this._homeRepoImpl, this.categoryName, this.category)
      : super(BooksCategoryInitial());

  Future<void> FetchCategoryBooks() async {
    emit(BooksCategoryLoading());
    try {
      final eitherBooks = await _homeRepoImpl.FetchCategoryBooks(categoryName);
      eitherBooks.fold(
            (failure) => emit(BooksCategoryFailure(error: failure.error)),
            (books) {

          emit(BooksCategorySuccess(books: books));
        },
      );
    } catch (e) {
      emit(BooksCategoryFailure(error: e.toString()));
    }
  }
}