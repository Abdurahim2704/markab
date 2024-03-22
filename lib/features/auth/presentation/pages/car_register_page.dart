import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/features/home/presentation/pages/main_home_page.dart';
import 'package:markab/features/auth/presentation/widgets/next_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CarRegisterPage extends StatefulWidget {
  const CarRegisterPage({super.key});

  @override
  State<CarRegisterPage> createState() => _CarRegisterPageState();
}

class _CarRegisterPageState extends State<CarRegisterPage> {
  final carNumberMask = MaskTextInputFormatter(mask: "##  @###@@ ", filter: {
    "@": RegExp(r"[a-zA-Z]"),
    "#": RegExp(r"[0-9]"),
  });
  final seriaNumberMask =
      MaskTextInputFormatter(mask: "##", filter: {"#": RegExp(r"[a-z]")});
  final seriaNumberMask2 =
      MaskTextInputFormatter(mask: "#######", filter: {"#": RegExp(r"[1-9]")});

  TextEditingController carNumberController = TextEditingController();
  final seriaCtrl = TextEditingController();
  final seriaNumberCtrl = TextEditingController();

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
                height: 20.h,
              ),
              Stack(
                alignment: const AlignmentDirectional(-.55, 0),
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    width: 240.sp,
                    height: 50.sp,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.oxFFB2D3FF,
                        width: 3,
                      ),
                    ),
                    child: TextField(
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      controller: carNumberController,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                          color: CustomColors.oxFF000000,
                          fontSize: 29.sp,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                          height: 1),
                      inputFormatters: [
                        carNumberMask,
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '01  A 111 AA',
                        hintStyle: TextStyle(
                          color: CustomColors.grey,
                          fontSize: 30.sp,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(
                                "assets/images/flag.png",
                              ),
                              height: 12.sp,
                              width: 25.sp,
                            ),
                            SizedBox(height: 4.sp),
                            Text(
                              "UZ",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Proxima Nova",
                                color: CustomColors.oxFF2F80ED,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onChanged: (value) {
                        carNumberController.text =
                            carNumberController.text.toUpperCase();
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50.sp,
                    width: 3,
                    child: const ColoredBox(
                      color: CustomColors.oxFFB2D3FF,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Passport va seriya raqami',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextField(
                      cursorHeight: 25.h,
                      controller: seriaCtrl,
                      inputFormatters: [
                        seriaNumberMask,
                        UpperCaseTextFormatter(),
                      ],
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.zero,
                      autocorrect: false,
                      style: TextStyle(
                        color: CustomColors.oxFF1E1E1E,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: CustomColors.oxFFB2D3FF,
                            ),
                            borderRadius: BorderRadius.circular(4.sp),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: CustomColors.oxFFB2D3FF,
                            ),
                            borderRadius: BorderRadius.circular(4.sp),
                          ),
                          hintText: "AB",
                          hintStyle: TextStyle(
                            color: CustomColors.grey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 7.sp, vertical: 7.sp)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      cursorHeight: 25.h,
                      controller: seriaNumberCtrl,
                      inputFormatters: [
                        seriaNumberMask2,
                      ],
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.zero,
                      autocorrect: false,
                      style: TextStyle(
                        color: CustomColors.oxFF1E1E1E,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: CustomColors.oxFFB2D3FF,
                            ),
                            borderRadius: BorderRadius.circular(4.sp),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: CustomColors.oxFFB2D3FF,
                            ),
                            borderRadius: BorderRadius.circular(4.sp),
                          ),
                          hintText: "1234567",
                          hintStyle: TextStyle(
                            color: CustomColors.grey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 7.sp, vertical: 7.sp)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              NextButton(
                text: "Keyingi",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainHomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
