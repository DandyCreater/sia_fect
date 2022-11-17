part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginDispose extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseModel? value;

  const LoginSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class LoginFailed extends LoginState {
  String? messages;
  

  LoginFailed({this.messages});

  @override
  // TODO: implement props
  List<Object> get props => [messages!];
}
