import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String leadingImage;
  final Widget? trailing;
  final Color containerColor;

  const ProfileTile({
    super.key,
    required this.title,
    required this.leadingImage,
    this.trailing,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 25.sp,
        width: 25.sp,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: SvgPicture.asset(
          leadingImage,
          width: 15.sp,
          height: 16.sp,
        ),
      ),
      minLeadingWidth: 40.sp,
      title: Text(
        title,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: "ProximaNova",
        color: CustomColors.oxFF1E1E1E,
      ),
      trailing: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blue.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: trailing,
          ),
        ),
      ),
    );
  }
}