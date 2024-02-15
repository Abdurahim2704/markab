import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
        home: const NotificationScreen(),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: CustomColors.scaffoldBackground,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/ic_arrow_back.svg",
            height: 16.sp,
            width: 12.sp,
          ),
        ),
        title: Text(
          'Sozlamalar',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            fontFamily: "Proxima Nova",
            color: CustomColors.oxFF2F80ED,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150.sp),
              SvgPicture.asset(
                "assets/icons/ic_bell.svg",
                height: 49.sp,
                width: 49.sp,
              ),
              SizedBox(height: 35.sp),
              Text(
                "Xabarlar mavjud emas",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Proxima Nova",
                  color: CustomColors.oxFF2F80ED,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Bu yerda hamma muhim xabarlar bo'ladi",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Proxima Nova",
                  color: CustomColors.oxFF2F80ED,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
