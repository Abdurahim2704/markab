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
      height: 25.sp,
      width: 133.sp,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
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
          SizedBox(width: 3.sp),
          Container(
            height: 25.sp,
            width: 2.5,
            color: CustomColors.oxFFB2D3FF,
          ),
          SizedBox(width: 10.sp),
          Text(
            "A 111 AA",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Proxima Nova",
              color: CustomColors.oxFF1E1E1E,
            ),
          ),
          SizedBox(width: 10.sp),
          Padding(
            padding: EdgeInsets.only(top: 3.0.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(
                    "assets/images/flag.png",
                  ),
                  height: 6.sp,
                  width: 12.sp,
                ),
                SizedBox(height: 1.sp),
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