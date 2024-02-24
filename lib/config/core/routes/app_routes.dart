import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:markab/config/core/routes/route.dart';
import 'package:markab/features/auth/presentation/pages/pages.dart';
import 'package:markab/features/card/presentation/all_cards_page/all_cards_page.dart';
import 'package:markab/features/home/presentation/pages/documents_page.dart';
import 'package:markab/features/home/presentation/pages/main_home_page.dart';
import 'package:markab/features/home/presentation/pages/notification_page/notification_page.dart';
import 'package:markab/features/home/presentation/pages/penalties_page/penalties_page.dart';
import 'package:markab/features/home/presentation/pages/profile_page/profile_page.dart';
import 'package:markab/features/home/presentation/pages/settings_page/FAQPage.dart';
import 'package:markab/features/home/presentation/pages/settings_page/change_language_page.dart';
import 'package:markab/features/home/presentation/pages/settings_page/change_theme_page.dart';
import 'package:markab/features/home/presentation/pages/settings_page/contact_page.dart';
import 'package:markab/features/home/presentation/pages/settings_page/settings_page.dart';
import 'package:markab/features/home/presentation/pages/settings_page/share_page.dart';
import 'package:markab/features/map/presentation/pages/map_page.dart';
import 'package:markab/features/master/presentation/master_view_page/master_view_page.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.home,
        path: "/",
        pageBuilder: (context, state) {
          return const MaterialPage(child: MainHomeScreen());
        },
      ),
      GoRoute(
          name: Routes.phoneNumberPage,
          path: "/phoneNumberPage",
          pageBuilder: (_, __) => const MaterialPage(child: PhoneNumberPage())),
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
          pageBuilder: (_, __) => const MaterialPage(child: CarRegisterPage())),
      GoRoute(
        name: Routes.choosingRolePage,
        path: "/choosing_role_page",
        pageBuilder: (_, __) => const MaterialPage(child: ChoosingRolePage()),
      ),
      GoRoute(
        path: "/map",
        name: Routes.mapPage,
        pageBuilder: (_, __) => const MaterialPage(child: MapScreen()),
      ),
      GoRoute(
        path: "/cards",
        name: Routes.cardsPage,
        pageBuilder: (_, __) => const MaterialPage(child: AllCardsPage()),
      ),
      GoRoute(
        path: "/mechanic",
        name: Routes.mechanicsPage,
        pageBuilder: (_, __) => const MaterialPage(child: MasterViewPage()),
      ),
      GoRoute(
        path: "/profile",
        name: Routes.profilePage,
        pageBuilder: (_, __) => const MaterialPage(child: ProfilePage()),
      ),
      GoRoute(
        path: "/settings",
        name: Routes.settingsPage,
        pageBuilder: (_, __) => const MaterialPage(child: SettingsScreen()),
      ),
      GoRoute(
        path: "/documents",
        name: Routes.documentsPage,
        pageBuilder: (_, __) => const MaterialPage(child: DocumentsPage()),
      ),
      GoRoute(
        path: "/penaltyPage",
        name: Routes.penaltyPage,
        pageBuilder: (_, __) => const MaterialPage(child: PenaltiesScreen()),
      ),
      GoRoute(
        path: "/notificationPage",
        name: Routes.notificationPage,
        pageBuilder: (_, __) => const MaterialPage(child: NotificationScreen()),
      ),
      GoRoute(
        path: "/change_theme_page",
        name: Routes.changeThemePage,
        pageBuilder: (_, __) => const MaterialPage(child: ChangeThemePage()),
      ),
      GoRoute(
        path: "/change_language_page",
        name: Routes.changeLanguagePage,
        pageBuilder: (_, __) => const MaterialPage(child: ChangeLanguagePage()),
      ),
      GoRoute(
        path: "/share_page",
        name: Routes.sharePage,
        pageBuilder: (_, __) => const MaterialPage(child: SharePage()),
      ),
      GoRoute(
        path: "/contact_page",
        name: Routes.contactPage,
        pageBuilder: (_, __) => const MaterialPage(child: ContactPage()),
      ),
      GoRoute(
        path: "/faq_page",
        name: Routes.faqPage,
        pageBuilder: (_, __) => const MaterialPage(child: FAQPage()),
      ),
    ],
  );
}
