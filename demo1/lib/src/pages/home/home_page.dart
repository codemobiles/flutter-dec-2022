import 'package:demo1/src/pages/app_routes.dart';
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
        title: Text('HomePage'),
      ),
      body: Column(
        children: [
          Text("HomePage"),
          BlocCounter()
        ],
      ),
    );
  }
}

class BlocCounter extends StatelessWidget {
  const BlocCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
          Text("0"),
          IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
        ],
      ),);
  }
}
