import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:markab/config/core/routes/route.dart';
import 'package:markab/features/auth/presentation/pages/pages.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.phoneNumberPage,
        path: "/",
        pageBuilder: (context, state) {
          return const MaterialPage(child: PhoneNumberPage());
        },
      ),
      GoRoute(
        name: Routes.otpPage,
        path: "/otp_page/:phone_number",
        pageBuilder: (context, state) {
          return MaterialPage(
            child: OTPPage(
              phoneNumber: state.pathParameters["phone_number"]!,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.carRegisterPage,
        path: "/car_register_page",
        pageBuilder: (context, state) {
          return const MaterialPage(child: CarRegisterPage());
        },
      ),
      GoRoute(
        name: Routes.choosingRolePage,
        path: "/choosing_role_page",
        pageBuilder: (context, state) {
          return const MaterialPage(child: ChoosingRolePage());
        },
      ),
    ],
  );
}
