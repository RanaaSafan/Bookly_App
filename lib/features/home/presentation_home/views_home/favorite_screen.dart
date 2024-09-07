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
        elevation: 2,
        title: Text(
          "Favorite List",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.teal[800],
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
         //   Navigator.pop(context);
          },
        ),
      ),
      body: ValueListenableBuilder<List<Books>>(
        valueListenable: FavoritesScreen.favoriteProductsNotifier,
        builder: (context, favoriteProducts, child) {
          if (favoriteProducts.isEmpty) {
            return _buildEmptyState();
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final book = favoriteProducts[index];
              return _buildFavoriteBookCard(book);
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 100,
            color: Colors.teal[800],
          ),
          const SizedBox(height: 20),
          Text(
            'No favorites added yet!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.teal[800],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Browse and add your favorite books.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteBookCard(Books book) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.grey.withOpacity(0.4),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            book.volumeInfo?.imageLinks?.thumbnail ??
                'assets/images/book1.jpeg',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          book.volumeInfo?.title ?? 'Book Title',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          book.volumeInfo?.authors?.join(', ') ?? 'Unknown Author',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: () {
            FavoritesScreen.removeFavorite(book);
          },
        ),
      ),
    );
  }
}
