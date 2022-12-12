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
            TextButton(onPressed: (){
              Navigator.pushNamed(context, AppRoute.login);
            }, child: Text("Button"))
          ],
        ));
  }
}
