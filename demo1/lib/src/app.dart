import 'package:demo1/src/bloc/home/home_bloc.dart';
import 'package:demo1/src/bloc/login/login_bloc.dart';
import 'package:demo1/src/pages/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/pages.dart';

final navigatorState = GlobalKey<NavigatorState>();


class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Provider vs Builder
    final loginBloc = BlocProvider<LoginBloc>(create: (context)=>LoginBloc());
    final homeBloc = BlocProvider<HomeBloc>(create: (context)=>HomeBloc());

    return MultiBlocProvider(
      providers: [loginBloc, homeBloc],
      child: MaterialApp(
        title: "CMApp",
        home: _initialPage(),
        routes: AppRoute.all,
        navigatorKey: navigatorState,
      ),
    );
  }

  _initialPage()  {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot){
        return LoginPage();
      },
    );
  }
}
