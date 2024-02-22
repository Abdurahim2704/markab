import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/shared/widgets/appbar_title.dart';
import 'dart:math';

class Documents {
  final String iconPath;
  final String title;
  final DateTime
      deadline; // String o'rniga DateTime bo'lishi kerak. 01.01.2031 => deadline.split(".") => 01 yanvar 2031
  final String chartDays;

  Documents.arrow({
    required this.iconPath,
    required this.title,
    required this.deadline,
    required this.chartDays,
  });
}

String durationToString(Duration duration) {
  int year = duration.inDays ~/ 365;
  int month = (duration.inDays % 365) ~/ 30;
  int day = duration.inDays % 30;

  return "${year > 0 ? "$year yil" : ""} ${month > 0 ? "$month oy" : ""} ${day > 0 ? "$day kun" : ""}";
}

Widget buildOption(
  Documents data,
  void Function() onTap,
) {
  final isEarlier = data.deadline.isBefore(DateTime.now());
  return InkWell(
    borderRadius: const BorderRadius.all(
      Radius.circular(6),
    ),
    onTap: onTap,
    child: Container(
      height: 105.sp,
      width: 266.sp,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
        border: Border.all(color: CustomColors.oxFFDADADA),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0.sp,
                  vertical: 10.sp,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      data.iconPath,
                      height: 25.sp,
                      width: 25.sp,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Proxima Nova",
                        color: CustomColors.oxFF4B4B4B,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0.sp,
                  vertical: 5.0.sp,
                ),
                child: Row(
                  children: [
                    Text(
                      "Tugash sanasi:",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "Proxima Nova",
                        fontWeight: FontWeight.w300,
                        color: CustomColors.oxFF4B4B4B,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "${data.deadline.day.toString().padLeft(2, "0")}.${data.deadline.month.toString().padLeft(2, "0")}.${data.deadline.year} ",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "Proxima Nova",
                        fontWeight: FontWeight.w700,
                        color: CustomColors.oxFF4B4B4B,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 24.sp,
              width: 270.sp,
              color: CustomColors.oxFFB2D3FF,
              child: Stack(
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(seconds: 1),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Container(
                        width: isEarlier
                            ? 270.sp
                            : value *
                                270.sp *
                                data.deadline
                                    .difference(DateTime.now())
                                    .inDays /
                                730,
                        decoration: BoxDecoration(
                          color:
                              isEarlier ? Colors.red : CustomColors.oxFF2F80ED,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                      );
                    },
                  ),
                  Center(
                    child: Text(
                      isEarlier
                          ? "Vaqt o'tib ketgan"
                          : durationToString(
                              data.deadline.difference(DateTime.now())),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: CustomColors.oxFFFFFFFF,
                        fontFamily: "Proxima Nova",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  static _leadingIcon(String last) => 'assets/icons/$last';

  get datas => <Documents>[
        Documents.arrow(
          iconPath: _leadingIcon("ic_technical_inspection.svg"),
          title: "Texnik ko’rik",
          deadline: DateTime.utc(2025, 1, 1),
          chartDays: "7 yil 28 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_insurance.svg"),
          title: "Sug’urta",
          deadline: DateTime.utc(2025, 1, 1),
          chartDays: "3 oy 24 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_assurance.svg"),
          title: "Ishonchnoma",
          deadline: DateTime.utc(2024, 11, 1),
          chartDays: "3 oy 24 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_tonirovka.svg"),
          title: "Tonirovka",
          deadline: DateTime.utc(2025, 10, 1),
          chartDays: "3 oy 24 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_oil.svg"),
          title: "Moyi",
          deadline: DateTime.utc(2025, 1, 1),
          chartDays: "3 oy 24 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_gas.svg"),
          title: "Gaz",
          deadline: DateTime.utc(2023, 1, 1),
          chartDays: "3 oy 24 kun",
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          text: "Xujjatlar",
        ),
        backgroundColor: CustomColors.scaffoldBackground,
        scrolledUnderElevation: 0,
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
      ),
      backgroundColor: CustomColors.scaffoldBackground,
      body: ListView.separated(
        itemCount: datas.length,
        separatorBuilder: (context, index) => SizedBox(height: 10.sp),
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 12.sp),
        itemBuilder: (context, index) {
          final data = datas[index];
          return buildOption(
            data,
            () {},
          );
        },
      ),
    );
  }
}
