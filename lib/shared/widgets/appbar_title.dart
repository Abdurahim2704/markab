import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/core/constants/colors.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  const AppBarTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: CustomColors.titleBlue,
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
