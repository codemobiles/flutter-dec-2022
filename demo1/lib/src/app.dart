import 'package:demo1/src/pages/app_routes.dart';
import 'package:flutter/material.dart';
import 'pages/pages.dart';

class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CMApp",
      home: HomePage(),
      routes: AppRoute.all,
    );
  }
}
