import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.yellow.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBox("111", Colors.red),
            _buildBox("222", Colors.yellow),
            _buildBox("333", Colors.purple),
          ],
        ),
      ),
    );
  }

  _buildBox(String title, Color color) {
    return Container(
        child: Text(
          title,
          style: TextStyle(fontSize: 40),
        ),
        color: color);
  }
}
