import 'package:flutter/material.dart';
import 'screens/First_page.dart';  // Updated import path

void main() {
  runApp(RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,  // Removes the debug banner
      home: FirstPage(),  // Sets FirstPage as the initial screen
    );
  }
}
