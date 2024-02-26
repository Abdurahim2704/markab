import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';

class CarNumber extends StatelessWidget {
  const CarNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.r),
        ),
        border: Border.all(
          color: CustomColors.oxFFB2D3FF,
          width: 2.5,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 3.sp),
          Text(
            "01",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Proxima Nova",
              color: CustomColors.oxFF1E1E1E,
            ),
          ),
          SizedBox(width: 3.w),
          Container(
            height: 25.h,
            width: 2.5.w,
            color: CustomColors.oxFFB2D3FF,
          ),
          SizedBox(width: 10.w),
          Text(
            "A 111 AA",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Proxima Nova",
              color: CustomColors.oxFF1E1E1E,
            ),
          ),
          SizedBox(width: 10.w),
          Padding(
            padding: EdgeInsets.only(top: 3.0.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(
                    "assets/images/flag.png",
                  ),
                  height: 6.h,
                  width: 12.w,
                ),
                SizedBox(height: 1.h),
                Text(
                  "UZ",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Proxima Nova",
                    color: CustomColors.oxFF4DB85E,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
