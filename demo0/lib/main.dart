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
      home: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "CodeMobiles",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
