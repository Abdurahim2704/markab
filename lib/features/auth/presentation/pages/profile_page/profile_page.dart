import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/theme/theme.dart';
import 'package:markab/features/auth/presentation/pages/profile_page/views/profile_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.scaffoldGradient,
          ),
          child: Column(
            children: [
              /// #Title Header
              Column(
                children: [
                  SizedBox(height: 60.sp),
                  Text(
                    "Profil",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.titleBlue,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  SvgPicture.asset(
                    "assets/icons/ic_profile_header.svg",
                    width: 65.sp,
                    height: 65.sp,
                  ),
                ],
              ),

              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileTile(
                    title: "Shaxsiy ma'lumotlar",
                    containerColor: Colors.white.withOpacity(0.6),
                    leadingImage: "assets/icons/ic_person.svg",
                    trailing: SvgPicture.asset(
                      "assets/icons/ic_arrow_forward.svg",
                      height: 15.sp,
                      width: 8.5.sp,
                    ),
                  ),
                  ProfileTile(
                    title: "Favourite Ustalar",
                    containerColor: Colors.white.withOpacity(0.6),
                    leadingImage: "assets/icons/ic_person.svg",
                    trailing: SvgPicture.asset(
                      "assets/icons/ic_arrow_forward.svg",
                      height: 15.sp,
                      width: 8.5.sp,
                    ),
                  ),
                  ProfileTile(
                    title: "Parol",
                    containerColor: Colors.white.withOpacity(0.6),
                    leadingImage: "assets/icons/ic_person.svg",
                    trailing: SvgPicture.asset(
                      "assets/icons/ic_arrow_forward.svg",
                      height: 15.sp,
                      width: 8.5.sp,
                    ),
                  ),
                  const ProfileTile(
                    containerColor: Color(0xFFEF5454),
                    leadingImage: "assets/icons/ic_log_out.svg",
                    title: "Chiqish",
                    trailing: SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
