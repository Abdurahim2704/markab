import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

class ChangeThemePage extends StatefulWidget {
  const ChangeThemePage({super.key});

  @override
  State<ChangeThemePage> createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int? index) {
    setState(() {
      _selectedIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.scaffoldBackground,
        scrolledUnderElevation: 0,
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
        forceMaterialTransparency: true,
        title: const AppBarTitle(text: "Rejim"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.sp),
        children: [
          ListTile(
            title: Text(
              'Kunduzgi rejim',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: CustomColors.oxFF4B4B4B,
                fontFamily: "Proxima Nova",
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/ic_light_theme.svg",
              width: 26.sp,
              height: 26.sp,
            ),
            trailing: Radio(
              value: 1,
              fillColor:
                  const MaterialStatePropertyAll(CustomColors.oxFF2F80ED),
              activeColor: CustomColors.oxFF2F80ED,
              groupValue: _selectedIndex,
              onChanged: _onItemTapped,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              'Tungi rejim',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: CustomColors.oxFF4B4B4B,
                fontFamily: "Proxima Nova",
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/ic_night_theme.svg",
              width: 26.sp,
              height: 26.sp,
            ),
            trailing: Radio(
              value: 0,
              activeColor: CustomColors.oxFF2F80ED,
              fillColor:
                  const MaterialStatePropertyAll(CustomColors.oxFF2F80ED),
              groupValue: _selectedIndex,
              onChanged: _onItemTapped,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              'Moslashuvchan',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: CustomColors.oxFF4B4B4B,
                fontFamily: "Proxima Nova",
              ),
            ),
            leading: SvgPicture.asset(
              "assets/icons/ic_flexible_theme.svg",
              width: 26.sp,
              height: 26.sp,
            ),
            trailing: Radio(
              value: 2,
              activeColor: CustomColors.oxFF2F80ED,
              fillColor:
                  const MaterialStatePropertyAll(CustomColors.oxFF2F80ED),
              groupValue: _selectedIndex,
              onChanged: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}
