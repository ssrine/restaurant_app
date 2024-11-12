import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Our Restaurant'),
      ),
      body: Center(
        child: Text(
          'Welcome to the restaurant app!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
