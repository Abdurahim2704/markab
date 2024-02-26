import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/features/master/presentation/master_detail_page/master_detail_page.dart';
import 'package:markab/main.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MasterDetailPage(master: master),
            ));
      },
      child: Container(
        width: 85.w,
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 12.w,
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
              width: 46.w,
              height: 46.h,
            ),
            SizedBox(height: 5.h),
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
                  height: 10.h,
                  width: 10.w,
                  image: const AssetImage(
                    "assets/icons/ic_star.png",
                  ),
                ),
                Image(
                  height: 10.h,
                  width: 10.w,
                  image: const AssetImage(
                    "assets/icons/ic_star.png",
                  ),
                ),
                Image(
                  height: 10.h,
                  width: 10.w,
                  image: const AssetImage(
                    "assets/icons/ic_star.png",
                  ),
                ),
                Image(
                  height: 10.h,
                  width: 10.w,
                  image: const AssetImage(
                    "assets/icons/ic_star.png",
                  ),
                  color: CustomColors.oxFFA3BFF3,
                ),
                Image(
                  height: 10.h,
                  width: 10.w,
                  image: const AssetImage(
                    "assets/icons/ic_star.png",
                  ),
                  color: CustomColors.oxFFA3BFF3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
