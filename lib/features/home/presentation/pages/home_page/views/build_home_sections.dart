import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';

Widget buildHomeSections({
  required String iconPath,
  required String text,
  required void Function()? onTap,
}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          height: 40.sp,
          width: 40.sp,
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: CustomColors.oxFFFFFFFF.withOpacity(0.6),
            borderRadius: BorderRadius.all(
              Radius.circular(6.r),
            ),
          ),
          child: SvgPicture.asset(
            iconPath,
          ),
        ),
      ),
      const SizedBox(height: 6),
      Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Proxima Nova",
          color: CustomColors.oxFF4B4B4B,
        ),
      ),
    ],
  );
}