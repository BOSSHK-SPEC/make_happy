import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_happy/view/screens/homePage.dart';
import 'package:make_happy/view/screens/loginScreen.dart';

import '../utility/mediaQuery.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryHelper.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //       begin: Alignment.topRight,
            //       end: Alignment.bottomLeft,
            //
            //       colors: [Color(0xFF1BFF0B),Color(0xD9000000),]
            //   ),
            // ),
            child: Hero(
              tag: 'image',
              child: Image.asset(
                "assets/images/danie-franco-CeZypKDceQc-unsplash.jpg",
                height: MediaQueryHelper.screenHeight,
                width: MediaQueryHelper.screenWidth,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // AnimatedTextKit(
          //   animatedTexts: [
          //     ColorizeAnimatedText(
          //       'Help',
          //       textStyle: TextStyle(fontSize: 50),
          //       colors: colorizeColors,
          //     ),
          //     ColorizeAnimatedText(
          //       'them to',
          //       textStyle: TextStyle(fontSize: 50),
          //       colors: colorizeColors,
          //     ),
          //     ColorizeAnimatedText(
          //       'Servive',
          //       textStyle: TextStyle(fontSize: 50),
          //       colors: colorizeColors,
          //     ),
          //   ],
          //   isRepeatingAnimation: true,
          //   pause: const Duration(milliseconds: 1000),
          //   displayFullTextOnTap: true,
          //   stopPauseOnTap: true,
          //   onTap: () {
          //     print("Tap Event");
          //   },
          // ),
        ],
      ),
    );
  }
}
