import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/core/routes/route.dart';
import 'package:markab/features/auth/presentation/widgets/next_button.dart';
import 'package:markab/features/auth/presentation/widgets/version_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  var maskTextInputFormatter = MaskTextInputFormatter(
    mask: ' ## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  var phoneNumber = "";
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ro’yhatdan o'ting",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Telefon raqamingizni kiriting',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              TextField(
                controller: controller,
                inputFormatters: [maskTextInputFormatter],
                textAlignVertical: TextAlignVertical.bottom,
                keyboardType: TextInputType.number,
                scrollPadding: EdgeInsets.zero,
                autofocus: true,
                autocorrect: false,
                onSubmitted: (value) {
                  print(value.length);
                  if (value.length == 13) {
                    phoneNumber = value.split(" ").join().split("-").join();
                    print(phoneNumber);
                  }
                },
                style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: 0.1),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: CustomColors.textfieldBorder,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: CustomColors.textfieldBorder,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    prefix: Text(
                      '+998',
                      style: TextStyle(
                          color: CustomColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.1),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 10.w),
                    isDense: true),
              ),
              SizedBox(
                height: 18.h,
              ),
              NextButton(
                text: "Keyingi",
                onPressed: () {
                  if (phoneNumber.isNotEmpty && mounted) {
                    context.goNamed(Routes.otpPage,
                        pathParameters: {"phone_number": phoneNumber});
                  }
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const VersionText(),
    );
  }
}
