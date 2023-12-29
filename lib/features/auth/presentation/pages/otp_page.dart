import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/features/auth/presentation/widgets/next_button.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/core/constants/colors.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool timeout = false;
  Stream<int> secundomer(int seconds) async* {
    if (seconds < 0) {
      return;
    }

    await Future.delayed(const Duration(seconds: 1));
    yield seconds;
    yield* secundomer(seconds - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: StreamBuilder(
              stream: secundomer(10),
              initialData: 10,
              builder: (context, snapshot) {
                final data = snapshot.data!;
                final minute = (data ~/ 60).toString().padLeft(2, "0");
                final second = (data % 60).toString().padLeft(2, "0");
                if (data > 0) {
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
                return TextButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      'Qayta jo’natish',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColors.primaryBlueColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                      ),
                    ));
              },
            ),
          )
        ],
      ),
      body: Center(
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
                onCompleted: (value) => print(value),
                isCursorAnimationEnabled: false,
              ),
              SizedBox(
                height: 36.h,
              ),
              const NextButton(text: "Keyingi")
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Text(
          'Versiya v1.0.0',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColors.cA0A0A0,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
