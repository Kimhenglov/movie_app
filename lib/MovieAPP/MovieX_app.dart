import 'package:flutter/material.dart';
//import 'package:pp/page/home_page.dart';
import 'package:pp/MovieAPP/splash_screen/splash_screen.dart';

class MoviePracticum_App extends StatelessWidget {
  const MoviePracticum_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "M_Cinema",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          // selectedItemColor: Colors.blue,
          // showSelectedLabels: true,
          // showUnselectedLabels: false,
        ),
        // textTheme: TextTheme(),
        // appBarTheme: AppBarTheme(),
        // floatingActionButtonTheme: FloatingActionButtonThemeData(),
      ),
    );
  }
}
