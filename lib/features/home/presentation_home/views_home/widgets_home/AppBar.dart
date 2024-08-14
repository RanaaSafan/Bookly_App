import 'package:flutter/material.dart';

class APPBAR extends StatefulWidget implements PreferredSizeWidget {
  const APPBAR({super.key});

  @override
  State<APPBAR> createState() => _APPBARState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _APPBARState extends State<APPBAR> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.book, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            'Booky ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // Add your search action here
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            // Add your notifications action here
          },
        ),
      ],
    );
  }
}