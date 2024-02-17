import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/theme/theme.dart';
import 'package:markab/features/auth/presentation/pages/settings_page/share_page.dart';
import 'package:markab/locator.dart';
import 'package:markab/observer.dart';

import 'FAQPage.dart';
import 'change_language_page.dart';
import 'change_theme_page.dart';
import 'contact_page.dart';

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
        home: const SettingsScreen(),
      ),
    );
  }
}

class SettingsOption {
  String title;
  String icon;
  void Function()? onClick;
  Widget? trailing;

  SettingsOption.arrow({
    required this.title,
    required this.icon,
    this.onClick,
    this.trailing,
  });
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackground,
      appBar: AppBar(
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
        title: Text(
          'Sozlamalar',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            fontFamily: "Proxima Nova",
            color: CustomColors.oxFF2F80ED,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          /// #Body
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 25.0.sp),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          final data = datas[index];
          return buildOption(
            context,
            index,
            data,
            () {},
          );
        },
        itemCount: datas.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 5.sp);
        },
      ),
    );
  }
}

Widget buildOption(
  BuildContext context,
  int index,
  SettingsOption data,
  void Function() onTap,
) {
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
            MaterialPageRoute(builder: (context) => const ChangeLanguagePage()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SharePage()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ContactPage()),
          );
          break;
        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FAQPage()),
          );
          break;
        default:
          break;
      }
    },
  );
}
