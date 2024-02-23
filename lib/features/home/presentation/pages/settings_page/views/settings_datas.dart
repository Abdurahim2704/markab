import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/features/home/presentation/pages/settings_page/views/settings_options.dart';

_profileIcon(String last) => 'assets/icons/$last';

get datas => <SettingsOption>[
      SettingsOption.arrow(
        title: "Tungi rejim",
        icon: _profileIcon('ic_theme_mode.svg'),
        trailing: SvgPicture.asset(
          "assets/icons/ic_arrow_forward.svg",
          height: 15.sp,
          width: 9.sp,
        ),
      ),
      SettingsOption.arrow(
        title: "Tilni o'zgartirish",
        icon: _profileIcon('ic_language.svg'),
        trailing: SvgPicture.asset(
          "assets/icons/ic_arrow_forward.svg",
          height: 15.sp,
          width: 9.sp,
        ),
      ),
      SettingsOption.arrow(
        title: 'Ulashish',
        icon: _profileIcon('ic_share.svg'),
        trailing: SvgPicture.asset(
          "assets/icons/ic_arrow_forward.svg",
          height: 15.sp,
          width: 9.sp,
        ),
      ),
      SettingsOption.arrow(
        title: "Bog'lanish",
        icon: _profileIcon('ic_contact.svg'),
        trailing: SvgPicture.asset(
          "assets/icons/ic_arrow_forward.svg",
          height: 15.sp,
          width: 9.sp,
        ),
      ),
      SettingsOption.arrow(
        title: 'FAQ',
        icon: _profileIcon('ic_faq.svg'),
        trailing: SvgPicture.asset(
          "assets/icons/ic_arrow_forward.svg",
          height: 15.sp,
          width: 9.sp,
        ),
      ),
    ];
