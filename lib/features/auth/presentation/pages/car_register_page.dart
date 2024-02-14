import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CarRegisterPage extends StatefulWidget {
  const CarRegisterPage({super.key});

  @override
  State<CarRegisterPage> createState() => _CarRegisterPageState();
}

class _CarRegisterPageState extends State<CarRegisterPage> {
  final carNumberMask = MaskTextInputFormatter(mask: "@ ### @@", filter: {
    "@": RegExp(r"[a-zA-Z]"),
    "#": RegExp(r"[0-9]"),
  });

  final node = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Avtomobil raqamini kiriting',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Stack(
                children: [
                  Align(
                    alignment: FractionalOffset(0.07, 0.5),
                    child: SizedBox(
                      width: 50.w,
                      child: TextField(
                        focusNode: node,
                        textAlignVertical: TextAlignVertical.bottom,
                        cursorHeight: 40,
                        style: TextStyle(
                          color: CustomColors.oxFF1E1E1E,
                          fontSize: 30.sp,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                          height: 0.03,
                        ),
                        inputFormatters: [
                          carNumberMask,
                        ],
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.oxFFB2D3FF,
                                width: 3.h),
                          ),
                          hintText: '01',
                          hintStyle: TextStyle(
                            color: CustomColors.grey,
                            fontSize: 30.sp,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                            height: 0.03,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.primaryBlueColor,
                                width: 3.h),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(0.945, 0.5),
                    child: SizedBox(
                      width: 200.w,
                      child: TextField(
                        focusNode: node,
                        textAlignVertical: TextAlignVertical.bottom,
                        cursorHeight: 40,
                        style: TextStyle(
                          color: CustomColors.oxFF1E1E1E,
                          fontSize: 30.sp,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                          height: 0.03,
                        ),
                        inputFormatters: [
                          carNumberMask,
                        ],
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.oxFFB2D3FF,
                                width: 3.h),
                          ),
                          hintText: 'A 111 AA',
                          hintStyle: TextStyle(
                            color: CustomColors.grey,
                            fontSize: 30.sp,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                            height: 0.03,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.primaryBlueColor,
                                width: 3.h),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
