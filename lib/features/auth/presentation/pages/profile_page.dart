import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/theme/theme.dart';
import 'package:markab/locator.dart';
import 'package:markab/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  Bloc.observer = MyGlobalObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(294, 636),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const ProfilePage(),
      ),
    );
  }
}

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
                  buildProfileTile(
                    title: "Shaxsiy ma'lumotlar",
                    containerColor: Colors.white.withOpacity(0.6),
                    leadingImage: "assets/icons/ic_person.svg",
                    trailing: SvgPicture.asset(
                      "assets/icons/ic_arrow_forward.svg",
                      height: 15.sp,
                      width: 8.5.sp,
                    ),
                  ),
                  buildProfileTile(
                    title: "Favourite Ustalar",
                    containerColor: Colors.white.withOpacity(0.6),
                    leadingImage: "assets/icons/ic_person.svg",
                    trailing: SvgPicture.asset(
                      "assets/icons/ic_arrow_forward.svg",
                      height: 15.sp,
                      width: 8.5.sp,
                    ),
                  ),
                  buildProfileTile(
                    title: "Parol",
                    containerColor: Colors.white.withOpacity(0.6),
                    leadingImage: "assets/icons/ic_person.svg",
                    trailing: SvgPicture.asset(
                      "assets/icons/ic_arrow_forward.svg",
                      height: 15.sp,
                      width: 8.5.sp,
                    ),
                  ),
                  buildProfileTile(
                    containerColor: const Color(0xFFEF5454),
                    leadingImage: "assets/icons/ic_log_out.svg",
                    title: "Chiqish",
                    trailing: const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildProfileTile({
    required String title,
    required String leadingImage,
    Widget? trailing,
    required Color containerColor,
  }) {
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
