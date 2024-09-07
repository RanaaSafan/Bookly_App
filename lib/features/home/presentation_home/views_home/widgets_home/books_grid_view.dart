import 'package:flutter/material.dart';
import '../../../data/models/books.dart';
import 'category_For_Grid_View.dart';

class BooksGridView extends StatelessWidget {
  final List<Books> books;

  const BooksGridView({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return const Center(
        child: Text(
          'No books available',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(), // Smooth bouncing effect
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 16.0, // Space between columns
          mainAxisSpacing: 16.0, // Space between rows
          childAspectRatio: 0.65, // Aspect ratio for item size
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return CategoryForGridView(books: book);
        },
      ),
    );
  }
}