
import 'package:flutter/material.dart';

import '../../../data/models/books.dart';
import '../favorite_screen.dart';
import 'book_details.dart';

class CategoryForGridView extends StatefulWidget {
  final Books books;

  const CategoryForGridView({super.key, required this.books});

  @override
  _CategoryForGridViewState createState() => _CategoryForGridViewState();
}

class _CategoryForGridViewState extends State<CategoryForGridView> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        FavoritesScreen.addFavorite(widget.books);
      } else {
        FavoritesScreen.removeFavorite(widget.books);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetails(book: widget.books,),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.white,
          elevation: 4, // Reduced elevation for a more subtle shadow
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                    child: Image.network(
                      widget.books.volumeInfo?.imageLinks?.thumbnail ?? 'assets/images/book1.jpeg',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: ValueListenableBuilder<List<Books>>(
                      valueListenable: FavoritesScreen.favoriteProductsNotifier,
                      builder: (context, favoriteProducts, child) {
                        final isFavorite = favoriteProducts.contains(widget.books);
                        return IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            toggleFavorite();
                            FavoritesScreen.favoriteProductsNotifier.notifyListeners();
                          },
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          widget.books.volumeInfo?.title ?? 'Product Title',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}