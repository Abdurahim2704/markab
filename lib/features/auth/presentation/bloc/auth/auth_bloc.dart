import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:markab/features/auth/domain/repository/auth_repository.dart';
import 'package:markab/locator.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<VerificationEvent>(_onVerification);
    on<VerificationTimeOut>(_onVerificationTimeout);
    on<SendCodeEvent>(_onSendCode);
  }

  void _onVerification(VerificationEvent event, Emitter emit) async {
    emit(AuthLoading(otp: state.otp));

    final verification =
        await getIt<AuthRepository>().sendVerification(event.phoneNumber);
    if (verification == null) {
      emit(AuthFailure(message: "Raqam mavjud emas", otp: state.otp));
      return;
    }
    if (verification != int.parse(event.otp)) {
      emit(AuthFailure(
          message: "Kod xato kiritilgan", otp: verification.toString()));
      return;
    }

    emit(VerificationSuccess(otp: state.otp));
  }

  void _onVerificationTimeout(VerificationTimeOut event, Emitter emit) async {
    emit(AuthFailure(message: "Yuborilgan kodni vaqti o'tdi", otp: state.otp));
  }

  void _onSendCode(SendCodeEvent event, Emitter emit) async {
    final code =
        await getIt<AuthRepository>().sendVerification(event.phoneNumber);
    if (code == null) {
      emit(AuthFailure(message: "Kiritilgan raqam noto'g'ri", otp: state.otp));
      return;
    }
    emit(VerificationWaiting(
      time: event.time,
      code: code.toString(),
      otp: code.toString(),
    ));
  }
}
