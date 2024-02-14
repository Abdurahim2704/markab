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
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.scaffoldGradient,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.sp,
                vertical: 5.sp,
              ),
              child: Column(
                children: [
                  buildHomeAppBar(),
                  SizedBox(height: 25.sp),

                  /// #Home Header
                  const HomeScreenHeader(),

                  SizedBox(height: 15.sp),

                  /// #Page Indicator
                  buildHeaderIndicator(),

                  SizedBox(height: 28.sp),

                  /// #Home Sections
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildHomeSections(
                        iconPath: "assets/icons/ic_car_document.svg",
                        text: "Xujjatlar",
                      ),
                      buildHomeSections(
                        iconPath: "assets/icons/ic_document.svg",
                        text: "Hisobot",
                      ),
                      buildHomeSections(
                        iconPath: "assets/icons/ic_penalty.svg",
                        text: "Jarima",
                      ),
                      buildHomeSections(
                        iconPath: "assets/icons/ic_navigator.svg",
                        text: "Navigator",
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        "Tanlangan Ustalar",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Proxima Nova",
                          color: CustomColors.oxFF4B4B4B,
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/ic_arrow_forward.svg",
                        ),
                      ),
                    ],
                  ),

                  /// #Chosen Master's CardTile
                  SizedBox(height: 15.sp),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChosenMastersCard(
                        masterName: "Muslim S.",
                        masterImagePath: "assets/images/img_master_muslim.png",
                      ),
                      ChosenMastersCard(
                        masterName: "Aziz",
                        masterImagePath: "assets/images/img_master_aziz.png",
                      ),
                      ChosenMastersCard(
                        masterName: "Sharif",
                        masterImagePath: "assets/images/img_master_sharif.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Container buildHeaderIndicator() {
  return Container(
    height: 18.sp,
    width: 45.sp,
    decoration: BoxDecoration(
      color: CustomColors.oxFFFCFCFC,
      borderRadius: BorderRadius.all(
        Radius.circular(10.r),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(1.sp, 3.sp),
          color: CustomColors.oxFF000000.withOpacity(0.2),
          blurRadius: 8,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 5.sp,
          backgroundColor: CustomColors.oxFFFF346AD2,
        ),
        CircleAvatar(
          radius: 5.sp,
          backgroundColor: CustomColors.oxFFB2D3FF,
        ),
      ],
    ),
  );
}

class ChosenMastersCard extends StatelessWidget {
  final String masterName;
  final String masterImagePath;

  const ChosenMastersCard({
    super.key,
    required this.masterName,
    required this.masterImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.sp,
      height: 105.sp,
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 12.sp,
      ),
      decoration: BoxDecoration(
        color: CustomColors.oxFFFFFFFF,
        borderRadius: BorderRadius.all(
          Radius.circular(6.r),
        ),
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(
              masterImagePath,
            ),
            width: 46.sp,
            height: 46.sp,
          ),
          SizedBox(height: 5.sp),
          Text(
            masterName,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Proxima Nova",
              color: CustomColors.oxFF366AD2,
            ),
          ),
          SizedBox(height: 5.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
              ),
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
              ),
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
              ),
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
                color: CustomColors.oxFFA3BFF3,
              ),
              Image(
                height: 10.sp,
                width: 10.sp,
                image: const AssetImage(
                  "assets/icons/ic_star.png",
                ),
                color: CustomColors.oxFFA3BFF3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.sp,
      width: 266.sp,
      padding: EdgeInsets.symmetric(
        horizontal: 5.0.sp,
        vertical: 5.0.sp,
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
          colors: [
            const Color(0xff0500FC).withOpacity(0.2),
            const Color(0xffFFFFFF).withOpacity(0.0),
            const Color(0xff366AD2).withOpacity(0.2),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xff366AD2).withOpacity(0.1),
            const Color(0xffFFFFFF).withOpacity(0.0),
            const Color(0xff366AD2).withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          /// #Header Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chevrolet Gentra",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.oxFF366AD2,
                  fontFamily: "Proxima Nova",
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/ic_edit.svg",
                  height: 21.sp,
                  width: 21.sp,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          /// #Car Number
          const CarNumber(),
          const SizedBox(height: 15),

          /// #Car Image
          Image(
            image: const AssetImage(
              "assets/images/img_gentra.png",
            ),
            height: 65.sp,
            width: 175.sp,
          ),
        ],
      ),
    );
  }
}

class CarNumber extends StatelessWidget {
  const CarNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.sp,
      width: 133.sp,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        border: Border.all(
          color: CustomColors.oxFFB2D3FF,
          width: 2.5,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 3.sp),
          Text(
            "01",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Proxima Nova",
              color: CustomColors.oxFF1E1E1E,
            ),
          ),
          SizedBox(width: 3.sp),
          Container(
            height: 25.sp,
            width: 2.5,
            color: CustomColors.oxFFB2D3FF,
          ),
          SizedBox(width: 10.sp),
          Text(
            "A 111 AA",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Proxima Nova",
              color: CustomColors.oxFF1E1E1E,
            ),
          ),
          SizedBox(width: 10.sp),
          Padding(
            padding: EdgeInsets.only(top: 3.0.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(
                    "assets/images/flag.png",
                  ),
                  height: 6.sp,
                  width: 12.sp,
                ),
                SizedBox(height: 1.sp),
                Text(
                  "UZ",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Proxima Nova",
                    color: CustomColors.oxFF4DB85E,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Row buildHomeAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blue.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          onTap: () {},
          child: SvgPicture.asset(
            "assets/icons/ic_settings.svg",
            height: 20.sp,
            width: 19.sp,
          ),
        ),
      ),
      Badge(
        offset: const Offset(6, -10),
        backgroundColor: CustomColors.oxFFEF5454,
        label: Text(
          "12",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "Proxima Nova",
            color: CustomColors.oxFFFCFCFC,
          ),
        ),
        largeSize: 18,
        alignment: AlignmentDirectional.topEnd,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.blue.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            onTap: () {},
            child: SvgPicture.asset(
              "assets/icons/ic_bell.svg",
              height: 28,
              width: 28,
            ),
          ),
        ),
      ),
    ],
  );
}

Column buildHomeSections({
  required String iconPath,
  required String text,
}) {
  return Column(
    children: [
      Container(
        height: 40.sp,
        width: 40.sp,
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: CustomColors.oxFFFFFFFF.withOpacity(0.6),
          borderRadius: BorderRadius.all(
            Radius.circular(6.r),
          ),
        ),
        child: SvgPicture.asset(
          iconPath,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Proxima Nova",
          color: CustomColors.oxFF4B4B4B,
        ),
      ),
    ],
  );
}
