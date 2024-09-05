import 'package:booky_app/core/network/service_locator.dart';
import 'package:booky_app/features/splash/presentation_splash/views/onboarding_screen.dart';
import 'package:booky_app/features/splash/presentation_splash/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/authentication/presentation/widget/login_screen.dart';
import 'features/home/presentation_home/views_home/BottomNavigationBar.dart';

 main()  {
 // WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
  setUp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Splashscreen(),

    );

  }
}
