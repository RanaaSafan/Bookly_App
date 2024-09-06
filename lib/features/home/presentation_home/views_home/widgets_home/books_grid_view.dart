import 'package:flutter/material.dart';


import '../../../data/models/books.dart';
import 'category_For_Grid_View.dart';

class BooksGridView extends StatelessWidget {
  final List<Books> books;

  const BooksGridView({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return Center(child: Text('No products available'));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true, // Allows GridView to fit within the constraints of its parent
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 8.0, // Horizontal spacing between items
          mainAxisSpacing: 8.0, // Vertical spacing between items
          childAspectRatio: 0.6, // Aspect ratio of each item
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