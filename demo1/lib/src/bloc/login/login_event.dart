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

// Register Event
class LoginEvent_Register extends LoginEvent{
  final User payload;
  LoginEvent_Register(this.payload);
}

// Forgot Event
class LoginEvent_Forgot extends LoginEvent{
  final String username;
  LoginEvent_Forgot(this.username);
}


// Logout Event
class LoginEvent_Logout extends LoginEvent{
  LoginEvent_Logout();
}