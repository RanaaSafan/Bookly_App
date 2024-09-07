import 'package:flutter/material.dart';
import 'package:booky_app/core/network/service_locator.dart';
import 'package:booky_app/features/home/data/repo/home_repo_impl.dart';
import 'package:booky_app/features/home/presentation_home/manager/All_Books/AllBooks_cubit.dart';
import 'package:booky_app/features/home/presentation_home/manager/best_seller/BestSeller_cubit.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/NewestBooks_view.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/list_viewBooks.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/profile.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/setting.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles.dart';
import 'about_screen.dart';
import 'developer_scree.dart';
import 'widgets_home/AppBar.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AllbooksCubit(getIt.get<HomeRepoImpl>())
              ..FeatchAllBooks()),
        BlocProvider(
            create: (context) => BestsellerCubit(getIt.get<HomeRepoImpl>())
              ..FeatchBestSellerBooks()),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFE0F7FA), // Light gray background
        appBar: const APPBAR(),
        drawer: _buildCustomDrawer(context),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE0F7FA), // Light gray
                Color(0xFFffffff), // Lighter gray
              ],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              _buildSectionTitle("All Books"),
              SliverToBoxAdapter(child: const ListViewBooks()),
              SliverToBoxAdapter(child: const SizedBox(height: 20)),
              _buildSectionTitle("Best Seller"),
              SliverToBoxAdapter(child: const NewestBooksView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Stlyes.textStyle24.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }

  Drawer _buildCustomDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent, // Darker background for header
              ),
              child: Center(
                child: Text(
                  'Bookly',
                  style: TextStyle(
                    color: Colors.white, // White text for contrast
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.pop(context);
                // Handle navigation to home screen
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.person_rounded,
              text: 'Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.info,
              text: 'About',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.developer_mode,
              text: 'Developers',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DevelopersScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildDrawerItem(
      BuildContext context, {
        required IconData icon,
        required String text,
        required GestureTapCallback onTap,
      }) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurpleAccent),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.grey.withOpacity(0.1),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}
