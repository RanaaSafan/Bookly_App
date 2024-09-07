import 'package:flutter/material.dart';

class APPBAR extends StatefulWidget implements PreferredSizeWidget {
  const APPBAR({super.key});

  @override
  State<APPBAR> createState() => _APPBARState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _APPBARState extends State<APPBAR> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00ACC1), // Cyan dark
              Color(0xFF607D8B), // Blue-grey
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.book, color: Colors.white, size: 28),
          const SizedBox(width: 8),
          Text(
            'Booky',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              shadows: [
                Shadow(
                  blurRadius: 6.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 1.0),
                ),
              ],
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white, size: 28),
          onPressed: () {
            // Search action
          },
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white, size: 28),
              onPressed: () {
                // Notifications action
              },
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
