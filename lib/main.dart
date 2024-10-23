
import 'package:ecommerce_uts/screens/home_screen.dart';
import 'package:ecommerce_uts/screens/login_screen.dart';
import 'package:ecommerce_uts/screens/navigation_screen.dart';
import 'package:ecommerce_uts/screens/splash_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecommerce",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF6C63FF),
      ),
      home: SplashScreen(),
    );
  }
}