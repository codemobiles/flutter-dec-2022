import 'package:demo1/src/constants/asset.dart';
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
    return Card(
      margin: const EdgeInsets.only(bottom: 24, left: 32, right: 32),
      child: Text("Form"),
    );
  }
}
