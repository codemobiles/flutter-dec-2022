import 'package:demo1/src/bloc/login/login_bloc.dart';
import 'package:demo1/src/pages/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/pages.dart';

class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginBloc = BlocProvider(create: (context)=>LoginBloc());

    return MultiBlocProvider(
      providers: [loginBloc],
      child: MaterialApp(
        title: "CMApp",
        home: LoginPage(),
        routes: AppRoute.all,
      ),
    );
  }
}
