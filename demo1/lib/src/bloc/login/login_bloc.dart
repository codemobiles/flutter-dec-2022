import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo1/src/app.dart';
import 'package:demo1/src/constants/app_setting.dart';
import 'package:demo1/src/models/user.dart';
import 'package:demo1/src/pages/app_routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // Login
    on<LoginEvent_Login>((event, emit) async {

      emit(state.copyWith(status: LoginStatus.fetching));
      // Simulate delay
      await Future.delayed(Duration(seconds: 1));

      final String username = event.payload.username;
      final String password = event.payload.password;

      if (username == 'admin' && password == '1234') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppSetting.token, 'TExkgk0494oksrkf');
        await prefs.setString(AppSetting.username, username);
        emit(state.copyWith(status: LoginStatus.success));
        await Future.delayed(Duration(seconds: 1));
        Navigator.pushReplacementNamed(navigatorState.currentContext!, AppRoute.home);
      }else{
        emit(state.copyWith(status: LoginStatus.failed));
      }
    });

    // Logout
    on<LoginEvent_Logout>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      Navigator.pushReplacementNamed(navigatorState.currentContext!, AppRoute.login);
      emit(state.copyWith(status: LoginStatus.init));
    });
  }
}
