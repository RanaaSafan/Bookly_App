import 'package:flutter/material.dart';
import '../../../data/models/category.dart';
import '../Category_Screen_Grid.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreenGrid(category: category),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          elevation: 12.0, // Increased elevation for a more pronounced look
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0), // More rounded corners
          ),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.asset(
                  category.imageUrl, // Ensure this path is correct
                  fit: BoxFit.cover,
                  height: 180,
                  width: double.infinity,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.2), // Subtle transparency
                        Colors.black.withOpacity(0.5), // Darker gradient
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    category.name,
                    style:  TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5, // Increased letter spacing
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[800]?.withOpacity(0.8), // Slightly lighter orange
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10.0,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 26, // Larger icon size
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
