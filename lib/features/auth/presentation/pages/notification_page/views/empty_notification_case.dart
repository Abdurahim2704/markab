import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';

class EmptyNotificationCase extends StatelessWidget {
  const EmptyNotificationCase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 150.sp),
        SvgPicture.asset(
          "assets/icons/ic_bell.svg",
          height: 49.sp,
          width: 49.sp,
        ),
        SizedBox(height: 35.sp),
        Text(
          "Xabarlar mavjud emas",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            fontFamily: "Proxima Nova",
            color: CustomColors.oxFF2F80ED,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Bu yerda hamma muhim xabarlar bo'ladi",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontFamily: "Proxima Nova",
            color: CustomColors.oxFF2F80ED,
          ),
        ),
      ],
    );
  }
}