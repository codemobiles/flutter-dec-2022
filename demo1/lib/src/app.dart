import 'package:demo1/src/bloc/home/home_bloc.dart';
import 'package:demo1/src/bloc/login/login_bloc.dart';
import 'package:demo1/src/bloc/management/management_bloc.dart';
import 'package:demo1/src/bloc/map/map_bloc.dart';
import 'package:demo1/src/constants/app_setting.dart';
import 'package:demo1/src/pages/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/loading/loading_page.dart';
import 'pages/pages.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat('#,###.000');
final formatNumber = NumberFormat('#,###');
final navigatorState = GlobalKey<NavigatorState>();

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    colors: true,
  ),
);

class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) {
      Logger.level = Level.nothing;
    } else {
      Logger.level = Level.debug;
    }

    // Provider vs Builder
    final loginBloc = BlocProvider<LoginBloc>(create: (context) => LoginBloc());
    final homeBloc = BlocProvider<HomeBloc>(create: (context) => HomeBloc());
    final managementBloc =
        BlocProvider<ManagementBloc>(create: (context) => ManagementBloc());
    final mapBloc = BlocProvider<MapBloc>(create: (context) => MapBloc());

    return MultiBlocProvider(
      providers: [loginBloc, homeBloc, managementBloc, mapBloc],
      child: MaterialApp(
        title: "CMApp",
        home: _initialPage(),
        routes: AppRoute.all,
        navigatorKey: navigatorState,
      ),
    );
  }

  _initialPage() {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          // Loading Page
          return LoadingPage();
        }

        final token = snapshot.data!.getString(AppSetting.token) ?? "";
        return token.isEmpty ? LoginPage() : HomePage();
      },
    );
  }
}
