import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/book_details.dart';
import 'package:flutter/material.dart';
import 'package:booky_app/features/home/data/models/books.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc

import '../../manager/All_Books/AllBooks_cubit.dart';
import '../../manager/All_Books/AllBooks_state.dart'; // Import your cubit

class AllBooks extends StatelessWidget {
  final Books book;

  const AllBooks({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllbooksCubit, AllBooksState>( // Wrap with BlocBuilder
      builder: (context, state) {
        if (state is AllBooksSuccess) {
          String? thumbnailUrl = book.volumeInfo?.imageLinks?.thumbnail;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Inside ListViewBooks (or wherever you navigate to BookDetails)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookDetails(book: book)),
                );
              },
              child: Container(
                height: 230,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _buildBookImage(thumbnailUrl),
                ),
              ),
            ),
          );
        } else if (state is AllBooksFailure) {
          return Text("Error fetching books."); // Improved error message
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildBookImage(String? thumbnailUrl) {
    if (thumbnailUrl != null && thumbnailUrl.isNotEmpty) {
      // Handle network images (assuming thumbnailUrl is a valid URL)
      return Image.network(
        thumbnailUrl,
        fit: BoxFit.cover, // Ensure image covers the container
        // errorBuilder: (context, error, stackTrace) {
        //   return Image.asset('assets/images/book1.jpeg', fit: BoxFit.cover);
        // },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
      );
    }

    // Fallback to a default image asset if thumbnailUrl is null or unrecognized format
    return Image.asset('assets/images/book1.jpeg', fit: BoxFit.cover);
  }

}