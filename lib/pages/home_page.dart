import 'package:flutter/material.dart';
import 'package:store_keeper_app/pages/add_product_page.dart';
import 'package:store_keeper_app/pages/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this is to control the bottom bar
  int _selectedIndex = 0;

  //this will update the index when the user taps on the navbar
  void navigateButtonBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    //main page
    ProductPage(),

    //add product page
    AddProductPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
