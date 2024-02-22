import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/features/home/presentation/pages/settings_page/views/settings_options.dart';

import '../FAQPage.dart';
import '../change_language_page.dart';
import '../change_theme_page.dart';
import '../contact_page.dart';
import '../share_page.dart';

class SettingsTile extends StatelessWidget {
  final int index;
  final SettingsOption data;
  final void Function() onTap;

  const SettingsTile({
    super.key,
    required this.index,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        data.icon,
        height: 25.sp,
        width: 25.sp,
      ),
      title: Text(
        data.title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          fontFamily: "Proxima Nova",
          color: CustomColors.oxFF1E1E1E,
        ),
      ),
      trailing: data.trailing,
      onTap: () {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangeThemePage(),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangeLanguagePage(),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SharePage(),
              ),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactPage(),
              ),
            );
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FAQPage(),
              ),
            );
            break;
          default:
            break;
        }
      },
    );
  }
}
