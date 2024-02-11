import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/features/auth/presentation/pages/map_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CarRegisterPage extends StatefulWidget {
  const CarRegisterPage({super.key});

  @override
  State<CarRegisterPage> createState() => _CarRegisterPageState();
}

class _CarRegisterPageState extends State<CarRegisterPage> {
  final carNumberMask = MaskTextInputFormatter(mask: "##   @ ### @@ ", filter: {
    "@": RegExp(r"[a-zA-Z]"),
    "#": RegExp(r"[0-9]"),
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Stack(alignment: AlignmentDirectional(-0.5, 0),
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                    width: 240.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: CustomColors.textfieldBorder, width: 3)),
                    child: TextField(

                      textAlignVertical: TextAlignVertical.center,
                      // cursorHeight: 40,
                      style: TextStyle(
                        color: CustomColors.black,
                        fontSize: 30.sp,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                      inputFormatters: [
                        carNumberMask,
                      ],
                      decoration: InputDecoration(
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: CustomColors.textfieldBorder,
                        //       width: 3.h),
                        // ),
                        border: InputBorder.none,
                        hintText: '01  A 111 AA',
                        hintStyle: TextStyle(
                          color: CustomColors.grey,
                          fontSize: 30.sp,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                          // height: 1,
                        ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: CustomColors.primaryBlueColor,
                        //       width: 3.h),
                        // ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 50.w,
                    width: 3,
                    child: ColoredBox(color: CustomColors.textfieldBorder),
                  )
                ],
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(),));
              }, child: Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
      ),
    );
  }
}
