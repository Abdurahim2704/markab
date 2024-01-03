part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {}

class VerificationTimeOut extends AuthEvent {}

class VerificationEvent extends AuthEvent {
  final String phoneNumber;
  final String otp;

  const VerificationEvent({required this.otp, required this.phoneNumber});
}

class SendCodeEvent extends AuthEvent {
  final String phoneNumber;
  final DateTime time;

  const SendCodeEvent({required this.time, required this.phoneNumber});
  @override
  List<Object?> get props => [time, phoneNumber];
}
