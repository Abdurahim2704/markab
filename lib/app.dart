import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/routes/app_routes.dart';
import 'package:markab/config/theme/theme.dart';
import 'package:markab/features/auth/presentation/bloc/auth/auth_bloc.dart';

import 'features/card/presentation/bloc/card_bloc/card_bloc.dart';

class MarkabApp extends StatelessWidget {
  const MarkabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CardBloc()
            ..add(
              const GetCardEvent(
                name: "name",
                expireDate: "10/24",
                cardNumber: "8600897876545634",
              ),
            ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(294, 636),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter().router,
        ),
      ),
    );
  }
}
