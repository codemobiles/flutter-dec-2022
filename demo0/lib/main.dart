import 'package:demo0/src/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }

  _buildHome() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "CodeMobiles",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

  }
}
