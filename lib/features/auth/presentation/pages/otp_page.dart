import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:markab/config/core/routes/route.dart';
import 'package:markab/features/auth/presentation/widgets/next_button.dart';
import 'package:markab/features/auth/presentation/widgets/resend_button.dart';
import 'package:markab/features/auth/presentation/widgets/version_text.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/core/constants/colors.dart';
import '../bloc/auth/auth_bloc.dart';

class OTPPage extends StatefulWidget {
  final String phoneNumber;
  const OTPPage({super.key, required this.phoneNumber});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool timeout = false;
  String otp = "";

  Stream<int> secundomer(int seconds) async* {
    if (seconds <= 0) {
      return;
    }

    await Future.delayed(const Duration(seconds: 1));
    yield seconds;
    yield* secundomer(seconds - 1);
  }

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(
        SendCodeEvent(time: DateTime.now(), phoneNumber: widget.phoneNumber));
  }

  void verificationSuccess(BuildContext context, AuthState state) {
    if (state is VerificationSuccess && mounted) {
      context.goNamed(Routes.choosingRolePage);
    }
  }

  void authFailure(BuildContext context, AuthState state) {
    if (state is AuthFailure) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  void nextButtonPress() {
    if (timeout) {
      context.read<AuthBloc>().add(VerificationTimeOut());
      return;
    }
    context
        .read<AuthBloc>()
        .add(VerificationEvent(otp: otp, phoneNumber: widget.phoneNumber));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: StreamBuilder(
              stream: secundomer(60),
              initialData: 60,
              builder: (context, snapshot) {
                final data = snapshot.data!;
                final minute = (data ~/ 60).toString().padLeft(2, "0");
                final second = (data % 60).toString().padLeft(2, "0");
                if (data > 1) {
                  timeout = false;
                  return Text(
                    '$minute:$second',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CustomColors.cA0A0A0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                    ),
                  );
                }
                timeout = true;
                return ResendButton(onPressed: () {
                  context.read<AuthBloc>().add(SendCodeEvent(
                      time: DateTime.now(), phoneNumber: widget.phoneNumber));
                  setState(() {});
                });
              },
            ),
          )
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          authFailure(context, state);
          verificationSuccess(context, state);
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SMS kodni kiriting",
                    style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Pinput(
                    length: 4,
                    autofocus: true,
                    cursor: Align(
                      alignment: const Alignment(0, 0.7),
                      child: Container(
                        width: 15,
                        height: 1.5,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: CustomColors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    showCursor: true,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    defaultPinTheme: PinTheme(
                      width: 45.w,
                      height: 40.h,
                      textStyle: TextStyle(
                        color: CustomColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColors.textfieldBorder),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onCompleted: (value) {
                      otp = value;
                    },
                    isCursorAnimationEnabled: false,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  NextButton(
                    text: "Keyingi",
                    onPressed: nextButtonPress,
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const VersionText(),
    );
  }
}
