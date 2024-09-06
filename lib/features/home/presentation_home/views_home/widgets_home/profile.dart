import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535156077167-5b7d5ee39888?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Replace with actual image
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add functionality for profile actions (e.g., edit profile)
              },
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
