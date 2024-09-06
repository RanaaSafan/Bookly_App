
import 'package:booky_app/features/home/presentation_home/manager/All_Books/AllBooks_cubit.dart';
import 'package:booky_app/features/home/presentation_home/manager/All_Books/AllBooks_state.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/allBooks.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewBooks extends StatefulWidget {
  const ListViewBooks({super.key});

  @override
  State<ListViewBooks> createState() => _ListViewBooksState();
}

class _ListViewBooksState extends State<ListViewBooks> {
  @override
  void initState() {
    super.initState();
    // Remove getBooks() call here
    context.read<AllbooksCubit>().FeatchAllBooks(); // Fetch data in initState
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllbooksCubit, AllBooksState>(
        builder: (context, state) {
          if (state is AllBooksSuccess) {
           return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return AllBooks(book: state.books[index]);
                },
              ),
            );
          } else if (state is AllBooksFailure) {
            return const Text("error ");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}