import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';

Container buildAppBarBottom({
  required int selectedIndex,
  required void Function(int index) onItemTapped,
}) {
  return Container(
    width: 260.sp,
    height: 40.sp,
    margin: EdgeInsets.symmetric(vertical: 10.h),
    decoration: const BoxDecoration(
      color: Color(0xFFF0F0F0),
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    ),
    child: Row(
      children: [
        /// #UnPaid Button
        InkWell(
          onTap: () => onItemTapped(0),
          child: Container(
            width: 130.sp,
            height: 38.sp,
            padding: EdgeInsets.only(left: 5.sp),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              color: selectedIndex == 0 ? CustomColors.oxFF2F80ED : null,
              boxShadow: selectedIndex == 0
                  ? [
                BoxShadow(
                  offset: const Offset(2, 1),
                  spreadRadius: 0,
                  blurRadius: 4,
                  color: CustomColors.oxFF737373.withOpacity(0.7),
                ),
              ]
                  : null,
            ),
            child: Row(
              children: [
                SizedBox(width: 3.w),
                Text(
                  "To'lanmagan",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "Proxima Nova",
                    fontWeight: FontWeight.w700,
                    color: selectedIndex == 0
                        ? CustomColors.oxFFFFFFFF
                        : CustomColors.oxFF2F80ED,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  height: 16.sp,
                  width: 16.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedIndex == 0
                        ? CustomColors.oxFFEF5454
                        : CustomColors.oxFFDADADA,
                  ),
                  child: Center(
                    child: Text(
                      "11",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Proxima Nova",
                        color: CustomColors.oxFFFFFFFF,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        ///#Paid Button
        InkWell(
          onTap: () => onItemTapped(1),
          child: Container(
            width: 130.sp,
            height: 38.sp,
            padding: EdgeInsets.only(left: 15.sp),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              color: selectedIndex == 1 ? CustomColors.oxFF2F80ED : null,
              boxShadow: selectedIndex == 1
                  ? [
                BoxShadow(
                  offset: const Offset(-2, 1),
                  spreadRadius: 0,
                  blurRadius: 4,
                  color: CustomColors.oxFF737373.withOpacity(0.7),
                ),
              ]
                  : null,
            ),
            child: Row(
              children: [
                Text(
                  "To'langan",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "Proxima Nova",
                    fontWeight: FontWeight.w700,
                    color: selectedIndex == 1
                        ? CustomColors.oxFFFFFFFF
                        : CustomColors.oxFF2F80ED,
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  height: 18.sp,
                  width: 18.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedIndex == 1
                        ? CustomColors.oxFF4DB85E
                        : CustomColors.oxFFDADADA,
                  ),
                  child: Center(
                    child: Text(
                      "6",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Proxima Nova",
                        color: CustomColors.oxFFFFFFFF,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}