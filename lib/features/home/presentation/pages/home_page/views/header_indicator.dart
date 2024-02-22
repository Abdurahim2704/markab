import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';

class HeaderBannerIndicator extends StatelessWidget {
  const HeaderBannerIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.sp,
      width: 45.sp,
      decoration: BoxDecoration(
        color: CustomColors.oxFFFCFCFC,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(1.sp, 3.sp),
            color: CustomColors.oxFF000000.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 4.5.sp,
            backgroundColor: CustomColors.oxFFFF346AD2,
          ),
          CircleAvatar(
            radius: 4.5.sp,
            backgroundColor: CustomColors.oxFFB2D3FF,
          ),
        ],
      ),
    );
  }
}
