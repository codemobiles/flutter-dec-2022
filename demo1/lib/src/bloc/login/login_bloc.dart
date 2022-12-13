import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo1/src/models/user.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // Login
    on<LoginEvent_Login>((event, emit) {
      final String username = event.payload.username;
      final String password = event.payload.password;

      if (username == 'admin' && password == '1234') {

      }

    });

    // Register
    on<LoginEvent_Register>((event, emit) {});
  }
}
