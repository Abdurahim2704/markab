import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/features/card/data/models/credit_card.dart';
import 'package:markab/features/card/presentation/all_cards_page/widgets/card_widget.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

import '../../../../config/theme/theme.dart';
import '../../../../locator.dart';
import '../../../../observer.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  Bloc.observer = MyGlobalObserver();

  runApp(MyApp());
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
      ],
      child: ScreenUtilInit(
        designSize: const Size(294, 636),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: AllCardsPage(),
        ),
      ),
    );
  }
}

class AllCardsPage extends StatelessWidget {
  final cards = [
    CreditCard.fromJson(const {
      "card_number": "1234-5678-9012-3456",
      "bank": "Fake Bank",
      "expire_date": "12/25",
      "name": "John Doe",
      "balance": 5000.28
    }),
    CreditCard.fromJson(const {
      "card_number": "9876-5432-1098-7654",
      "bank": "Fictional Financial",
      "expire_date": "08/23",
      "name": "Alice Wonderland",
      "balance": 7500.0
    }),
    CreditCard.fromJson(const {
      "card_number": "5555-1234-5678-9999",
      "bank": "Imaginary International",
      "expire_date": "04/26",
      "name": "Bob Johnson",
      "balance": 12000.0
    }),
    CreditCard.fromJson(const {
      "card_number": "4444-8765-1234-5678",
      "bank": "Dream Bank",
      "expire_date": "11/27",
      "name": "Eleanor Smith",
      "balance": 9200.0
    }),
  ];
  AllCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          text: "Kartalar",
        ),
        actions: [
          MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 30.w,
            height: 30.w,
            onPressed: () {},
            color: CustomColors.titleBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.sp))),
            child: const Icon(
              CupertinoIcons.plus,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.scaffoldGradient,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: ListView.separated(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
