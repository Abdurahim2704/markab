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
  List<String> penalties = [
    "RA23688690390 - Tezlikni oshirish (20 km-dan kup bulmagan) - 330 000 so'm",
    "RA23688690390 - Tezlikni oshirish (20 km-dan kup bulmagan) - 330 000 so'm",
    "RA23688690390 - Tezlikni oshirish (20 km-dan kup bulmagan) - 330 000 so'm",
  ];
  List<String> paidPenalties = [];

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
            height: 16.sp,
            width: 12.sp,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50.sp),
          child: Container(
            width: 260.sp,
            height: 40.sp,
            decoration: const BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size(130.sp, 38.sp),
                    foregroundColor: _selectedIndex == 0
                        ? Colors.white
                        : const Color(0xFF9FA8B2),
                    backgroundColor:
                        _selectedIndex == 0 ? CustomColors.oxFF2F80ED : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 10,
                  ),
                  onPressed: () => _onItemTapped(0),
                  child: Text(
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
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size(130.sp, 38.sp),
                    foregroundColor: _selectedIndex == 1
                        ? Colors.white
                        : const Color(0xFF9FA8B2),
                    backgroundColor:
                        _selectedIndex == 1 ? CustomColors.oxFF2F80ED : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () => _onItemTapped(1),
                  child: Text(
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
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount:
            _selectedIndex == 0 ? penalties.length : paidPenalties.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _selectedIndex == 0
                  ? penalties[index].split('-')[0]
                  : paidPenalties[index].split('-')[0],
            ),
            subtitle: Text(
              _selectedIndex == 0
                  ? penalties[index].split('-')[1]
                  : paidPenalties[index].split('-')[1],
            ),
            trailing: Text(
              _selectedIndex == 0
                  ? penalties[index].split('-')[2]
                  : paidPenalties[index].split('-')[2],
            ),
          );
        },
      ),
    );
  }
}
