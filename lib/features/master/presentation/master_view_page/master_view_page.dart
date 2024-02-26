import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/features/auth/data/models/location.dart';
import 'package:markab/features/auth/data/models/mechanic.dart';
import 'package:markab/features/master/presentation/master_view_page/widgets/master_card.dart';
import 'package:markab/features/master/presentation/master_view_page/widgets/search_field.dart';
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

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
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
        minTextAdapt: true,
        splitScreenMode: true,
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
  final master = Mechanic(
    userId: 1,
    location: Location(latitude: 3.2, longitude: 4.2),
    id: 1,
    name: "Jumayev Firdavs",
    grade: 3,
    about: "Men yaxshi dasturchiman hozir TATUda o'qiyman",
    address: "Mening adresim Yunusobod 9",
    phoneNumbers: [
      "+998905486416",
      "+998930806416",
    ],
    skills: [
      "dasturlash",
      "payvandalsh",
      "ovqat qilish",
      "o'qish",
      "fizika",
      "matematika",
      "dasturlash",
      "payvandalsh",
      "ovqat qilish",
      "o'qish",
      "fizika",
      "matematika",
      "dasturlash",
      "payvandalsh",
      "ovqat qilish",
      "o'qish",
      "fizika",
      "matematika",
    ],
    image: "https://via.placeholder.com/126x126",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.oxFFFFFFFF,
        scrolledUnderElevation: 0,
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
              const SearchField(),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MasterCard(
                          master: master,
                        ),
                        SizedBox(height: 12.w)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
