import 'package:booky_app/features/home/data/repo/home_repo_impl.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/books_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/service_locator.dart';
import '../../data/models/category.dart';
import '../manager/category_books/categoryBooks_cubit.dart';
import '../manager/category_books/categoryBooks_state.dart';

class CategoryScreenGrid extends StatefulWidget {
  final Category category;

  const CategoryScreenGrid({super.key, required this.category});

  @override
  State<CategoryScreenGrid> createState() => _CategoryScreenGridState();
}

class _CategoryScreenGridState extends State<CategoryScreenGrid> {
  late final BooksCategoryCubit _booksCategoryCubit;

  @override
  void initState() {
    super.initState();
    _booksCategoryCubit = BooksCategoryCubit(
      getIt.get<HomeRepoImpl>(),
      widget.category.name,
      widget.category, // Pass the category object
    )..FetchCategoryBooks();
  }

  @override
  void dispose() {
    _booksCategoryCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _booksCategoryCubit,
      child: BlocBuilder<BooksCategoryCubit, BooksCategoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                widget.category.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.orange,
                ),
              ),
              centerTitle: true,
            ),
            body: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BooksCategoryState state) {
    if (state is BooksCategorySuccess) {
      if (state.books == null || state.books.isEmpty) {
        return Center(child: Text('No books available'));
      }
      return BooksGridView(books: state.books);
    } else if (state is BooksCategoryFailure) {
      return Center(child: Text("Error: ${state.error}"));
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
