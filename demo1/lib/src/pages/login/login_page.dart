import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top:80.0),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              Text("LoginPage"),
            ],
          ),
        ),
      ),
    );
  }
}
