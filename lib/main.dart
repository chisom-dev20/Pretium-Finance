import 'package:flutter/material.dart';
import 'package:pretium_finance/pages/home_page.dart';
import 'package:pretium_finance/pages/splash_screen.dart';
import 'package:pretium_finance/resources/navigation/navigation_host_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pretium Finance',
      home: NavigationHostPage(),
    );
  }
}
