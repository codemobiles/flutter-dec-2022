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

      emit(state.copyWith(status: LoginStatus.fetching));
      // Simulate delay
      await Future.delayed(Duration(seconds: 2));

      final String username = event.payload.username;
      final String password = event.payload.password;

      if (username == 'admin' && password == '1234') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppSetting.token, 'TExkgk0494oksrkf');
        await prefs.setString(AppSetting.username, username);
        emit(state.copyWith(status: LoginStatus.success));
      }else{
        emit(state.copyWith(status: LoginStatus.failed));
      }
    });

    // Register
    on<LoginEvent_Register>((event, emit) {});
  }
}
