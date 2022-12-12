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
          children: [
            _buildBox(),
          ],
        ),
      ),
    );
  }

  _buildBox() {
    return Container(
      child: Text("111"),
      color: Colors.red,
    );
  }
}
