//import 'dart:html';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pp/MovieAPP/main_page.dart';
//import 'package:pp/models/api_logics.dart';
//import 'package:pp/MovieAPP/page/home_page.dart';
//import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // _init() async {
  //   await context.read<MovieAPI>().getData();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoadingPage(),
    );
  }

  Widget _buildLoadingPage() {
    return AnimatedSplashScreen(
      splash: Image.asset("Logo/Cinema_rv.png"),
      nextScreen: MoviePracticum(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 300,
      splashIconSize: 500,
      //pageTransitionType: PageTransition,
      backgroundColor: Colors.greenAccent,
    );
  }
}
