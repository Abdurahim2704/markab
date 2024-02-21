import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

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

Widget buildOption(
  Documents data,
  void Function() onTap,
) {
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
                      "${data.deadline.month} ${data.deadline.year} ${data.deadline.day}",
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
              width: double.infinity,
              color: CustomColors.oxFFB2D3FF,
              child: Stack(
                children: [
                  Container(
                    width: data.deadline == "01-yanvar 2031" ? 210.w : 126.w,
                    decoration: const BoxDecoration(
                      color: CustomColors.oxFF2F80ED,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      data.chartDays,
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
          deadline: DateTime.utc(2031, 1,1),
          chartDays: "7 yil 28 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_insurance.svg"),
          title: "Sug’urta",
          deadline: DateTime.utc(2031, 1,1),
          chartDays: "3 oy 24 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_assurance.svg"),
          title: "Ishonchnoma",
          deadline: DateTime.utc(2031, 1,1),
          chartDays: "3 oy 24 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_tonirovka.svg"),
          title: "Tonirovka",
          deadline: DateTime.utc(2031, 1,1),
          chartDays: "3 oy 24 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_oil.svg"),
          title: "Moyi",
          deadline: DateTime.utc(2031, 1,1),
          chartDays: "3 oy 24 kun",
        ),
        Documents.arrow(
          iconPath: _leadingIcon("ic_gas.svg"),
          title: "Gaz",
          deadline: DateTime.utc(2031, 1,1),
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
