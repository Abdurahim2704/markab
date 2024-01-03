import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/core/constants/colors.dart';

class NextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const NextButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: CustomColors.primaryBlueColor,
      padding: EdgeInsets.symmetric(vertical: 9.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.w))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                height: 0.06,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
