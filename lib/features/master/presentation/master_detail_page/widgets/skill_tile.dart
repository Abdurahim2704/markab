import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillTile extends StatelessWidget {
  final String skill;
  const SkillTile({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFE5F0FF),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.sp)),
      ),
      child: Text(
        skill,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF366AD2),
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
