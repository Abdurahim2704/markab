import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/features/home/presentation/pages/penalties_page/views/app_bar_bottom.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

class PenaltiesScreen extends StatefulWidget {
  const PenaltiesScreen({super.key});

  @override
  State<PenaltiesScreen> createState() => _PenaltiesScreenState();
}

class _PenaltiesScreenState extends State<PenaltiesScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(text: "Jarimalar"),
        scrolledUnderElevation: 0,
        backgroundColor: CustomColors.scaffoldBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/ic_arrow_back.svg",
            height: 15.sp,
            width: 12.sp,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 62.sp),
          child: buildAppBarBottom(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: _selectedIndex == 0 ? 11 : 6,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6.r),
              ),
              side: const BorderSide(color: Color(0xFFDADADA)),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "RA23688690390",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: CustomColors.oxFFA0A0A0,
                      ),
                    ),
                    Text(
                      "22-sen2023",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: CustomColors.oxFFA0A0A0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.sp),
                Text(
                  "Tezlikni oshirish (20 km-dan ko'p bulmagan)",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.oxFF4B4B4B,
                  ),
                ),
                SizedBox(height: 5.sp),
                Text(
                  "330 000 so’m",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: _selectedIndex == 0
                        ? CustomColors.oxFFEF5454
                        : CustomColors.oxFF4DB85E,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
