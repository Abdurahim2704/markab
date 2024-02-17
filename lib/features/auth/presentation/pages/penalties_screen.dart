import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';
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
          child: Container(
            width: 260.sp,
            height: 40.sp,
            margin: EdgeInsets.symmetric(vertical: 10.h),
            decoration: const BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Row(
              children: [
                /// #Paid Button
                InkWell(
                  onTap: () => _onItemTapped(0),
                  child: Container(
                    width: 130.sp,
                    height: 38.sp,
                    padding: EdgeInsets.only(left: 5.sp),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color:
                          _selectedIndex == 0 ? CustomColors.oxFF2F80ED : null,
                      boxShadow: _selectedIndex == 0
                          ? [
                              BoxShadow(
                                offset: const Offset(2, 1),
                                spreadRadius: 0,
                                blurRadius: 4,
                                color: CustomColors.oxFF737373.withOpacity(0.7),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 3.w),
                        Text(
                          "To'lanmagan",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Proxima Nova",
                            fontWeight: FontWeight.w700,
                            color: _selectedIndex == 0
                                ? CustomColors.oxFFFFFFFF
                                : CustomColors.oxFF2F80ED,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          height: 16.sp,
                          width: 16.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedIndex == 0
                                ? CustomColors.oxFFEF5454
                                : CustomColors.oxFFDADADA,
                          ),
                          child: Center(
                            child: Text(
                              "11",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Proxima Nova",
                                color: CustomColors.oxFFFFFFFF,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ///#Paid Button
                InkWell(
                  onTap: () => _onItemTapped(1),
                  child: Container(
                    width: 130.sp,
                    height: 38.sp,
                    padding: EdgeInsets.only(left: 15.sp),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color:
                          _selectedIndex == 1 ? CustomColors.oxFF2F80ED : null,
                      boxShadow: _selectedIndex == 1
                          ? [
                              BoxShadow(
                                offset: const Offset(-2, 1),
                                spreadRadius: 0,
                                blurRadius: 4,
                                color: CustomColors.oxFF737373.withOpacity(0.7),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "To'langan",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Proxima Nova",
                            fontWeight: FontWeight.w700,
                            color: _selectedIndex == 1
                                ? CustomColors.oxFFFFFFFF
                                : CustomColors.oxFF2F80ED,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 18.sp,
                          width: 18.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedIndex == 1
                                ? CustomColors.oxFF4DB85E
                                : CustomColors.oxFFDADADA,
                          ),
                          child: Center(
                            child: Text(
                              "6",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Proxima Nova",
                                color: CustomColors.oxFFFFFFFF,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
