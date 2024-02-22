import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';

class ChosenMastersCard extends StatelessWidget {
  final String masterName;
  final String masterImagePath;

  const ChosenMastersCard({
    super.key,
    required this.masterName,
    required this.masterImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.sp,
      height: 105.sp,
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 12.sp,
      ),
      decoration: BoxDecoration(
        color: CustomColors.oxFFFFFFFF,
        borderRadius: BorderRadius.all(
          Radius.circular(6.r),
        ),
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(
              masterImagePath,
            ),
            width: 46.sp,
            height: 46.sp,
          ),
          SizedBox(height: 5.sp),
          Text(
            masterName,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Proxima Nova",
              color: CustomColors.oxFF366AD2,
            ),
          ),
          SizedBox(height: 5.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
              ),
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
              ),
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
              ),
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
                color: CustomColors.oxFFA3BFF3,
              ),
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
                color: CustomColors.oxFFA3BFF3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
