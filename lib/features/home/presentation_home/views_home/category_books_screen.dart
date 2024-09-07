import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/categories.dart';
import 'package:flutter/material.dart';

import '../../data/models/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // Define the list of categories here
  final List<Category> categories = [
    Category(name: 'Romantic', imageUrl: 'category image/5958669826849359164.jpg',),
    Category(name: 'Health & Fitness', imageUrl: 'category image/5974518475214933883.jpg',),
    Category(name: 'Commedy', imageUrl: 'category image/5958669826849359165.jpg',),

    Category(name: 'Scary', imageUrl: 'category image/5958669826849359167.jpg',),

    Category(name: 'Cartion', imageUrl: 'category image/5958669826849359219.jpg',),

    Category(name: 'Cooking', imageUrl: 'category image/5958669826849359220.jpg',),

    Category(name: 'Technology', imageUrl: 'category image/5958669826849359221.jpg',),
   Category(name: 'Drama', imageUrl: 'category image/5974518475214933884.jpg',),
    Category(name: 'medical', imageUrl: 'category image/5974518475214933885.jpg',),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Categories",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.teal[800],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.stacked_line_chart),
            color:Colors.teal[800],
            onPressed: () {

            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryCard(category: categories[index]),
          );
        },
      ),
    );
  }
}