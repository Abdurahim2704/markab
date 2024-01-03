part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  final String? otp;
  const AuthState({this.otp});

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial({super.otp});
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({required this.message, required super.otp});
}

class SignUpFailure extends AuthState {
  const SignUpFailure({required super.otp});
}

class VerificationSuccess extends AuthState {
  const VerificationSuccess({required super.otp});
}

class AuthLoading extends AuthState {
  const AuthLoading({required super.otp});
}

class SignInFailure extends AuthState {
  const SignInFailure({required super.otp});
}

class VerificationWaiting extends AuthState {
  final DateTime time;
  final String code;
  const VerificationWaiting(
      {required this.time, required this.code, required super.otp});

  @override
  List<Object?> get props => [time, code];
}
