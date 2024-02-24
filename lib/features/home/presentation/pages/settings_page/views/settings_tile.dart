import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/core/routes/route.dart';
import 'package:markab/features/home/presentation/pages/settings_page/views/settings_options.dart';

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
            context.pushNamed(Routes.changeThemePage);
            break;
          case 1:
            context.pushNamed(Routes.changeLanguagePage);
            break;
          case 2:
            context.pushNamed(Routes.sharePage);
            break;
          case 3:
            context.pushNamed(Routes.contactPage);
            break;
          case 4:
            context.pushNamed(Routes.faqPage);
            break;
          default:
            break;
        }
      },
    );
  }
}
