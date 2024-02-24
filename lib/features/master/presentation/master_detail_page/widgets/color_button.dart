import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ColorButton extends StatelessWidget {
  final Color color;
  final String icon;
  final void Function() onTap;
  const ColorButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.all(10.sp),
      color: color,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(
            width: 10.w,
          ),
          Text(
            'Qo’ng’iroq',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
