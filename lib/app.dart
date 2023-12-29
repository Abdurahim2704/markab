import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/theme/theme.dart';
import 'package:markab/features/auth/presentation/pages/car_register_page.dart';

class MarkabApp extends StatelessWidget {
  const MarkabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(294, 636),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const CarRegisterPage(),
      ),
    );
  }
}
