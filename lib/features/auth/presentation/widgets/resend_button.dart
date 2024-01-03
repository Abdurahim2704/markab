import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/core/constants/colors.dart';

class ResendButton extends StatelessWidget {
  final void Function() onPressed;
  const ResendButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
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
    ;
  }
}
