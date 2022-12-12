import 'dart:math';

import 'package:demo1/src/constants/asset.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String message = "Debug:";

  @override
  void initState() {
    super.initState();
    _usernameController.text = "admin";
    _passwordController.text = "1234";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_buildHeader(), _buildForm()],
          ),
        ),
      ),
    );
  }

  _buildHeader() {
    return SizedBox(
      width: 300,
      child: Image.asset(Asset.logoImage),
    );
  }

  _buildForm() {
    final ramdon = Random();
    final ramdonNumber = ramdon.nextDouble();

    return Card(
      margin: const EdgeInsets.only(top: 24, left: 32, right: 32),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'codemobiles@gmail.com',
                  labelText: 'Username',
                  icon: Icon(Icons.email),
                )),
            TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  icon: Icon(Icons.lock),
                )),
            Text(message, style: TextStyle(color: Color(0xFFFF0000)),),
            ElevatedButton(
                onPressed: () {
                  message = "Debug: ${ramdonNumber}";
                  setState(() {});
                },
                child: Text("Login")),
            OutlinedButton(onPressed: () {}, child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
