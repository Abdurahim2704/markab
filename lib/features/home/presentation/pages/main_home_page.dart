import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/features/card/presentation/all_cards_page/all_cards_page.dart';
import 'package:markab/features/master/presentation/master_view_page/master_view_page.dart';

import '../../../../config/theme/theme.dart';
import '../../../../locator.dart';
import '../../../../observer.dart';
import '../../../card/presentation/bloc/card_bloc/card_bloc.dart';
import 'home_page/home_page.dart';
import 'profile_page/profile_page.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';

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
                expireDate: "expireDate",
                cardNumber: "cardNumber",
              ),
            ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(294, 636),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const MainHomeScreen(),
        ),
      ),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          pageController.jumpToPage(currentIndex);
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.oxFF53639A,
        fixedColor: CustomColors.oxFF53639A,
        items: [
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset(
              "assets/icons/ic_home_filled.svg",
              width: 25.sp,
              height: 25.sp,
            ),
            icon: SvgPicture.asset(
              "assets/icons/ic_home.svg",
              width: 19.sp,
              height: 15.sp,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset(
              "assets/icons/ic_card_filled.svg",
              width: 25.sp,
              height: 25.sp,
            ),
            icon: SvgPicture.asset(
              "assets/icons/ic_card.svg",
              width: 19.sp,
              height: 15.sp,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset(
              "assets/icons/ic_masters_filled.svg",
              width: 25.sp,
              height: 25.sp,
            ),
            icon: SvgPicture.asset(
              "assets/icons/ic_masters.svg",
              width: 20.sp,
              height: 17.sp,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset(
              "assets/icons/ic_profile_filled.svg",
              width: 25.sp,
              height: 25.sp,
            ),
            icon: SvgPicture.asset(
              "assets/icons/ic_profil.svg",
              width: 18.sp,
              height: 14.sp,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          AllCardsPage(),
          MasterViewPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
