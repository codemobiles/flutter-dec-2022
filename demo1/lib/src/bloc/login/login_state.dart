part of 'login_bloc.dart';

enum LoginStatus { fetching, success, failed, init }

class LoginState extends Equatable {
  final LoginStatus status;
  const LoginState({this.status = LoginStatus.init});

  @override
  List<Object> get props => [];
}
