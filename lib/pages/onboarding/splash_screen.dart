import 'package:flutter/material.dart';
import 'package:pretium_finance/pages/onboarding/walk_through_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/app_images.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigation.navigateToScreen(
          context: context, screen: const WalkThroughPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AppImages.logoSample),
        ],
      ),
    );
  }
}
