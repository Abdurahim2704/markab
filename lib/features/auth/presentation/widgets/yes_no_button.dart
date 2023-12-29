import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';

class YesNoButton extends StatelessWidget {
  final Widget child;
  final Color fillColor;
  final bool hasBorder;
  const YesNoButton({
    super.key,
    required this.child,
    required this.fillColor,
    required this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      highlightElevation: 6,
      focusElevation: 0,
      onPressed: () {},
      padding: EdgeInsets.symmetric(vertical: 9.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.w),
        ),
        side: hasBorder
            ? const BorderSide(
                color: CustomColors.primaryBlueColor,
              )
            : BorderSide.none,
      ),
      elevation: 0,
      color: fillColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [child],
        ),
      ),
    );
  }
}
