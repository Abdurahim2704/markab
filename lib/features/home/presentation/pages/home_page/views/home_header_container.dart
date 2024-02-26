import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';

import 'car_number.dart';

class HomeHeaderContainer extends StatelessWidget {
  const HomeHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 266.w,
      padding: EdgeInsets.symmetric(
        horizontal: 5.0.w,
        vertical: 5.0.h,
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
          colors: [
            const Color(0xff0500FC).withOpacity(0.2),
            const Color(0xffFFFFFF).withOpacity(0.0),
            const Color(0xff366AD2).withOpacity(0.2),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xff366AD2).withOpacity(0.1),
            const Color(0xffFFFFFF).withOpacity(0.0),
            const Color(0xff366AD2).withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          /// #Header Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chevrolet Gentra",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.oxFF366AD2,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/ic_edit.svg",
                  height: 21.sp,
                  width: 21.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          /// #Car Number
          const CarNumber(),

          SizedBox(height: 10.h),

          /// #Car Image
          Image(
            image: const AssetImage(
              "assets/images/img_gentra.png",
            ),
            height: 60.h,
            width: 170.h,
          ),
        ],
      ),
    );
  }
}
