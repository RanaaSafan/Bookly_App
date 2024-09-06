
import 'package:booky_app/core/network/service_locator.dart';
import 'package:booky_app/features/home/data/repo/home_repo_impl.dart';
import 'package:booky_app/features/home/presentation_home/manager/All_Books/AllBooks_cubit.dart';
import 'package:booky_app/features/home/presentation_home/manager/best_seller/BestSeller_cubit.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/NewestBooks_view.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/list_viewBooks.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/profile.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles.dart';
import 'widgets_home/AppBar.dart';

class Screen1 extends StatefulWidget   {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AllbooksCubit(getIt.get<HomeRepoImpl>())..FeatchAllBooks()),
        BlocProvider(create: (context)=>BestsellerCubit(getIt.get<HomeRepoImpl>())..FeatchBestSellerBooks()),

      ],
      child:
      Scaffold(
        backgroundColor: Colors.black,
        appBar: APPBAR(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle navigation to home screen here
                },
              ),
              ListTile(
                leading: Icon(Icons.person_rounded),
                title: Text('profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                  // Handle navigation to books screen
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red, Colors.pinkAccent, Colors.pink],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ListViewBooks()),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: Text("  Best Saller",style: Stlyes.textStyle24,)),
              SliverToBoxAdapter(child: NewestBooksView()),
            ],
          ),
        ),
      )
    );
  }
}