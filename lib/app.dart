import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/routes/app_routes.dart';
import 'package:markab/config/theme/theme.dart';
import 'package:markab/features/auth/presentation/bloc/auth/auth_bloc.dart';

class MarkabApp extends StatelessWidget {
  const MarkabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(294, 636),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter().router,
          // home: const CarRegisterPage(),
        ),
      ),
    );
  }
}
