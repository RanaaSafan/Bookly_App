import 'package:flutter/material.dart';
import 'screen1.dart';
import 'category_books_screen.dart';
import 'favorite_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Screen1(),
    const CategoryScreen(),
    const FavoritesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(40),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 30),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category, size: 30),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, size: 30),
                  label: 'Favorite',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Colors.teal[800], // Dark teal for selected items
              unselectedItemColor: Colors.teal[300], // Lighter teal for unselected items
              backgroundColor: Colors.transparent, // Transparent for gradient effect
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              elevation: 0, // Removing default elevation
            ),
          ),
        ),
      ),
    );
  }
}
