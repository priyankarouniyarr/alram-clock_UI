import 'package:flutter/material.dart';
import 'package:alaram_clockapp/homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadeAnimation;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize the animation controller
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    // Define the fade and scale animations
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController!);
    scaleAnimation = Tween<double>(begin: 0.5, end: 2.0).animate(animationController!);

    // Start the animations
    animationController!.forward();

    // Navigate to home screen after the animation
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your background color
      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation!,
          child: ScaleTransition(
            scale: scaleAnimation!,
            child: Image.asset(
              'images/alaram_clock.png', // Your splash screen image
              width: 150,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
