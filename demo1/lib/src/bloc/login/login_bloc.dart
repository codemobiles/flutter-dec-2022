import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo1/src/constants/app_setting.dart';
import 'package:demo1/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // Login
    on<LoginEvent_Login>((event, emit) async {
      final String username = event.payload.username;
      final String password = event.payload.password;

      if (username == 'admin' && password == '1234') {
          // SharedPreferences prefs;
          //
          // SharedPreferences.getInstance().then((value)  {
          //   SharedPreferences.getInstance().then((value)  {
          //     SharedPreferences.getInstance().then((value)  {
          //       SharedPreferences.getInstance().then((value)  {
          //         prefs = value;
          //       });
          //     });
          //   });
          // });

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppSetting.token, 'TExkgk0494oksrkf');
        await prefs.setString(AppSetting.username, username);

      }

    });

    // Register
    on<LoginEvent_Register>((event, emit) {});
  }
}
