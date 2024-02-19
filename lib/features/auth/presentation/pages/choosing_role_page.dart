import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/core/constants/icons.dart';
import 'package:markab/config/core/routes/route.dart';
import 'package:markab/features/auth/presentation/widgets/next_button.dart';
import 'package:markab/features/auth/presentation/widgets/version_text.dart';
import 'package:markab/features/auth/presentation/widgets/yes_no_button.dart';

class ChoosingRolePage extends StatefulWidget {
  const ChoosingRolePage({super.key});

  @override
  State<ChoosingRolePage> createState() => _ChoosingRolePageState();
}

class _ChoosingRolePageState extends State<ChoosingRolePage> {
  String choice = "Haydovchi";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        CustomIcons.driverIcon,
                        width: 38.w,
                        height: 43.h,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Text(
                        'Haydovchi',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.oxFF1E1E1E,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Transform.scale(
                        scale: 1.1.sp,
                        child: Radio(
                          value: "Haydovchi",
                          groupValue: choice,
                          onChanged: (value) {
                            setState(() {
                              choice = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        CustomIcons.masterIcon,
                        width: 38.w,
                        height: 43.h,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Text(
                        'Usta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.oxFF1E1E1E,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Transform.scale(
                        scale: 1.1.sp,
                        child: Radio(
                          value: "Usta",
                          groupValue: choice,
                          visualDensity: VisualDensity.standard,
                          onChanged: (value) {
                            setState(() {
                              choice = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 27.h,
              ),
              Text(
                'Mashinangiz bormi ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColors.oxFF1E1E1E,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 0.06,
                ),
              ),
              SizedBox(
                height: 16.sp,
              ),
              Offstage(
                offstage: choice == "Haydovchi",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    YesNoButton(
                      fillColor: CustomColors.textfieldGrey,
                      hasBorder: false,
                      child: Text(
                        'Ha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.oxFF1E1E1E,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    YesNoButton(
                      fillColor: Colors.white,
                      hasBorder: true,
                      child: Text(
                        'Yo’q',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.primaryBlueColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Offstage(
                offstage: choice == "Usta",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    NextButton(
                      text: "Keyingi",
                      onPressed: () {
                        context.goNamed(Routes.carRegisterPage);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const VersionText(),
    );
  }
}
