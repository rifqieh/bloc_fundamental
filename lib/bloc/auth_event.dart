part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthByEmailPassword extends AuthEvent {
  final String email;
  final String password;

  AuthByEmailPassword(this.email, this.password);
}

class AuthByGoogle extends AuthEvent {}

class AuthByFacebook extends AuthEvent {}
