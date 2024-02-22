import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/theme/theme.dart';
import 'package:markab/features/auth/presentation/pages/settings_page/views/settings_datas.dart';
import 'package:markab/features/auth/presentation/pages/settings_page/views/settings_tile.dart';
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
        home: const SettingsScreen(),
      ),
    );
  }
}



class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          return SettingsTile(
            index: index,
            data: data,
            onTap: () {},
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
