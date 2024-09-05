import 'dart:async';

import 'package:booky_app/features/authentication/presentation/widget/login_screen.dart';
import 'package:booky_app/features/home/presentation_home/views_home/screen1.dart';
import 'package:booky_app/features/splash/presentation_splash/views/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    slidingAnimation = Tween(begin: Offset(0, 7), end: Offset.zero).animate(
        animationController);
    animationController.forward();




    Timer(const Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

@override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("BOOKLY ",style: Stlyes.textStyle20,)),
        SlideTransition(
            position: slidingAnimation,
            child: Center(child: Text("Hello in Bookly App",style: Stlyes.textStyle10,)))
      ],
    );
  }
}
