import 'package:flutter/material.dart';

import 'pages.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';
  static const management = 'management';
  static const map = 'map';

  static get all => <String, WidgetBuilder>{
        login: (context) => const LoginPage(), // demo how to used widget
        home: (context) => const HomePage(),
        management: (context) => const ManagementPage(),
        map: (context)=> const MapPage()
      };
}
