
import 'package:bloc/bloc.dart';
import 'package:booky_app/features/home/presentation_home/manager/All_Books/AllBooks_cubit.dart';
import 'package:booky_app/features/home/presentation_home/manager/All_Books/AllBooks_state.dart';
import 'package:booky_app/features/splash/presentation_splash/views/widgets/splash_widget.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xff100B20),
     body: SplashWidget(),
   );
  }
}
