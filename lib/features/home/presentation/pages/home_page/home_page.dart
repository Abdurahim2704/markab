import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/theme/theme.dart';
import 'package:markab/features/home/presentation/pages/documents_page.dart';
import 'package:markab/features/home/presentation/pages/home_page/views/build_home_sections.dart';
import 'package:markab/features/home/presentation/pages/home_page/views/chosen_masters_card.dart';
import 'package:markab/features/home/presentation/pages/home_page/views/home_app_bar.dart';
import 'package:markab/features/home/presentation/pages/home_page/views/home_header.dart';

import '../penalties_page/penalties_page.dart';

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
                  /// #AppBar
                  const HomeAppBar(),
                  SizedBox(height: 25.sp),

                  /// #Home Header
                  const HomeScreenHeader(),

                  SizedBox(height: 28.sp),

                  /// #Home Sections
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildHomeSections(
                        iconPath: "assets/icons/ic_car_document.svg",
                        text: "Xujjatlar",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DocumentsPage(),
                            ),
                          );
                        },
                      ),
                      buildHomeSections(
                        iconPath: "assets/icons/ic_document.svg",
                        text: "Hisobot",
                        onTap: () {},
                      ),
                      buildHomeSections(
                        iconPath: "assets/icons/ic_penalty.svg",
                        text: "Jarima",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PenaltiesScreen(),
                            ),
                          );
                        },
                      ),
                      buildHomeSections(
                        iconPath: "assets/icons/ic_navigator.svg",
                        text: "Navigator",
                        onTap: () {},
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
