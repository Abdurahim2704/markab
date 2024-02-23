import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';


class HeaderPageIndicator extends StatelessWidget {
  const HeaderPageIndicator({
    super.key,
    required int currentPage,
  }) : _currentPage = currentPage;

  final int _currentPage;

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
          for (int i = 0; i < 2; i++)
            CircleAvatar(
              radius: 4.5.sp,
              backgroundColor: i == _currentPage
                  ? CustomColors.oxFFFF346AD2
                  : CustomColors.oxFFB2D3FF,
            ),
        ],
      ),
    );
  }
}