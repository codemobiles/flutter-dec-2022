part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent_Login extends LoginEvent{
  final User payload;
  LoginEvent_Login(this.payload);
}
