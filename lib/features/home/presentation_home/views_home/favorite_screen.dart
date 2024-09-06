
import 'package:flutter/material.dart';

import '../../data/models/books.dart';

class FavoritesScreen extends StatefulWidget {
  static ValueNotifier<List<Books>> favoriteProductsNotifier = ValueNotifier([]);

  static void addFavorite(Books book) {
    if (!favoriteProductsNotifier.value.contains(book)) {
      favoriteProductsNotifier.value = [...favoriteProductsNotifier.value, book];
    }
  }

  static void removeFavorite(Books book) {
    favoriteProductsNotifier.value =
        favoriteProductsNotifier.value.where((p) => p != book).toList();
  }

  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Favorite List",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<List<Books>>(
        valueListenable: FavoritesScreen.favoriteProductsNotifier,
        builder: (context, favoriteProducts, child) {
          if (favoriteProducts.isEmpty) {
            return const Center(child: Text('No favorites added.'));
          }
          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final book = favoriteProducts[index];
              return ListTile(
                leading: Image.network(
                  book.volumeInfo?.imageLinks?.thumbnail  ?? 'https://via.placeholder.com/150',
                  width: 50,
                  height: 50,
                ),
                title: Text(book.volumeInfo?.title ?? 'Product Title'),
                subtitle: Text(book.volumeInfo?.authors?.join(', ') ?? '',),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        FavoritesScreen.removeFavorite(book);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}