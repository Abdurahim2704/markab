import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';

import 'car_number.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.sp,
      width: 266.sp,
      padding: EdgeInsets.symmetric(
        horizontal: 5.0.sp,
        vertical: 5.0.sp,
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
                  fontFamily: "Proxima Nova",
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
          const SizedBox(height: 10),

          /// #Car Number
          const CarNumber(),

          const SizedBox(height: 15),

          /// #Car Image
          Image(
            image: const AssetImage(
              "assets/images/img_gentra.png",
            ),
            height: 65.sp,
            width: 175.sp,
          ),
        ],
      ),
    );
  }
}
