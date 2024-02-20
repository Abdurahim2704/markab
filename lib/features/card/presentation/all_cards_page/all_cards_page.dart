import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/features/card/presentation/all_cards_page/widgets/card_widget.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

import '../../../../config/theme/theme.dart';
import '../../../../locator.dart';
import '../../../../observer.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../bloc/card_bloc/card_bloc.dart';

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
              const SaveCardEvent(
                name: "name",
                expireDate: "09/12",
                cardNumber: "fdghjkgadsk",
              ),
            )
            ..add(const GetLocalCardEvent()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(294, 636),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const AllCardsPage(),
        ),
      ),
    );
  }
}

class AllCardsPage extends StatelessWidget {
  const AllCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: CustomColors.oxFFFFFFFF,
        title: const AppBarTitle(
          text: "Kartalar",
        ),
        actions: [
          MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 27.sp,
            height: 27.sp,
            onPressed: () {},
            color: CustomColors.titleBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.sp),
              ),
            ),
            child: const Icon(
              CupertinoIcons.plus,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.scaffoldGradient,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              child: BlocBuilder<CardBloc, CardState>(
                builder: (context, state) {
                  return ListView.separated(
                    itemCount: state.cards.length,
                    itemBuilder: (context, index) {
                      final card = state.cards[index];
                      return CreditCardWidget(
                        card: card,
                        color: CustomColors.cardColors[index % 3],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 13.h,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
