import 'package:flutter/material.dart';
import 'package:store_keeper_app/pages/splash_screen.dart';
import 'package:store_keeper_app/services/theme/dark_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkMode,
      home: SplashScreen(),
    );
  }
}
