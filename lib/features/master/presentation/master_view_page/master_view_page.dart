import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            ..add(const GetCardEvent(
                name: "name",
                expireDate: "expireDate",
                cardNumber: "cardNumber")),
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
        title: AppBarTitle(
          text: "Ustalar",
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.scaffoldGradient
          ),
          child: ,
        ),
      ),
    );
  }
}
