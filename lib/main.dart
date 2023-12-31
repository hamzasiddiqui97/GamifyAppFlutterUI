import 'package:flutter/material.dart';
import 'package:gamify_app/pages/home_page.dart';
import 'package:gamify_app/utils/animations/login_page_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamify App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) =>  const AnimatedLoginPage(),
        '/homepage' : (context) =>  const MyHomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
