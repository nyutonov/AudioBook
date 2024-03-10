part of 'login_bloc.dart';

class LoginState {
  Status? status;

  LoginState({
    this.status
  });

  LoginState copyWith({
    Status? status
  }) => LoginState(
    status: status ?? this.status
  );
}