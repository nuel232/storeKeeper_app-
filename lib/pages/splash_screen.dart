import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'package:flutter/material.dart';
import 'package:store_keeper_app/pages/product_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to home_screen after 3 seconds
    //   Timer(const Duration(seconds: 3), () {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => ProductPage()),
    //     );
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
