import 'package:booky_app/features/splash/presentation_splash/views/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnboardingWidget(),
      ),
    );
  }
}