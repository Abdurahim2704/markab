import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/core/constants/icons.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

import '../../../../config/theme/theme.dart';
import '../../../../locator.dart';
import '../../../../observer.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../../../card/presentation/bloc/card_bloc/card_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CardBloc()
            ..add(
              const GetCardEvent(
                name: "name",
                expireDate: "expireDate",
                cardNumber: "cardNumber",
              ),
            ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(294, 636),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const MasterViewPage(),
        ),
      ),
    );
  }
}

class MasterViewPage extends StatefulWidget {
  const MasterViewPage({super.key});

  @override
  State<MasterViewPage> createState() => _MasterViewPageState();
}

class _MasterViewPageState extends State<MasterViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          text: "Ustalar",
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(gradient: AppTheme.scaffoldGradient),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              TextField(
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: CustomColors.oxFFF0F0F0, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: CustomColors.oxFFF0F0F0, width: 1),
                  ),
                  focusColor: Colors.transparent,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: Container(
                      height: 15.sp,
                      width: 15.sp,
                      margin: EdgeInsets.symmetric(
                        horizontal: 7.sp,
                        vertical: 7.sp,
                      ),
                      child: SvgPicture.asset(
                        CustomIcons.filterIcon,
                        height: 15.sp,
                        width: 15.sp,
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color(0xFFF0F0F0), width: 1.sp),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.sp),
                    ),
                  ),
                  hintText: "Qidirish",
                  hintStyle: TextStyle(
                    color: const Color(0xFFE0E0E0),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: 12.sp,
                      width: 12.sp,
                      margin: EdgeInsets.symmetric(
                        horizontal: 7.sp,
                        vertical: 7.sp,
                      ),
                      child: Image.asset(
                        CustomIcons.searchIcon,
                        height: 15.sp,
                        width: 15.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 24.sp,
                              child: const Image(
                                image: AssetImage(
                                  "assets/images/img_master_muslim.png",
                                ),
                              ),
                            ),
                            SizedBox(width: 10.sp),
                            //#name and adress
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ...[
                                          for (int i = 0; i < 4; i++)
                                            Icon(
                                              Icons.star,
                                              color: CustomColors.oxFFFFE925,
                                              size: 12.sp,
                                            ),
                                          for (int i = 0; i < 1; i++)
                                            Icon(
                                              Icons.star,
                                              size: 12.sp,
                                              color: CustomColors.oxFFE5F0FF,
                                            )
                                        ]
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Muslim Sobirov',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: CustomColors.oxFF4B4B4B,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'Mirzo Ulug’bek, Toshkent sh.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: CustomColors.titleBlue,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w300,
                                      height: 0.10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'MATOR buzuldimi hech ikkilanmasadan bizga olib kelavering, qo’li gul ustalarimiz hammasini zo’r qilib . berishadi',
                          style: TextStyle(
                            color: CustomColors.oxFFA0A0A0,
                            fontSize: 10.sp,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(height: 12.sp),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            runSpacing: 2.h,
                            spacing: 2.w,
                            children: [
                              ...[
                                for (int i = 0; i < 7; i++)
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: const ShapeDecoration(
                                      color: CustomColors.oxFFE5F0FF,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Mator',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: CustomColors.oxFF366AD2,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                              ],
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
