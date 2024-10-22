import 'dart:async';
import 'package:ecommerce_uts/screens/home_screen.dart';
import 'package:ecommerce_uts/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("images/image2.jpg"),
            fit: BoxFit.cover,
            opacity: 0.4,
            ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 250,
              color: Color(0xFF6C63FF),
            ),
            Text(
              "IPIN SHOP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
            ),
            )
          ],
        ),
        
      ),
    );
  }
}