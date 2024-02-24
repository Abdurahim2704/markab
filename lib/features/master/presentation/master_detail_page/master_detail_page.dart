import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/core/constants/icons.dart';
import 'package:markab/features/auth/data/models/mechanic.dart';
import 'package:markab/features/master/presentation/master_detail_page/widgets/color_button.dart';
import 'package:markab/features/master/presentation/master_detail_page/widgets/skill_tile.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

import '../../../../config/theme/theme.dart';

class MasterDetailPage extends StatelessWidget {
  final Mechanic master;
  const MasterDetailPage({super.key, required this.master});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: AppBarTitle(
          text: master.name,
        ),
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
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(gradient: AppTheme.scaffoldGradient),
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.sp, vertical: 12.sp),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.sp)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 125.sp,
                            width: 125.sp,
                            child: master.image == null
                                ? const SizedBox.shrink()
                                : Image.network(
                                    master.image!,
                                    fit: BoxFit.fitHeight,
                                  ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ...[
                                    for (int i = 0;
                                        i < master.grade.toInt();
                                        i++)
                                      Image.asset("assets/icons/ic_star.png"),
                                    for (int i = 0;
                                        i < (5 - master.grade.toInt());
                                        i++)
                                      SizedBox(
                                        height: 30,
                                        child: Image.asset(
                                          "assets/icons/ic_star.png",
                                          fit: BoxFit.fitHeight,
                                          color: CustomColors.skillBlue,
                                        ),
                                      )
                                  ]
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                master.grade.toInt().toDouble().toString(),
                                style: TextStyle(
                                  color: CustomColors.cardBlue,
                                  fontSize: 45.sp,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w800,
                                  height: 0.02,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Ism familiya',
                        style: TextStyle(
                          color: CustomColors.cardBlue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        master.name,
                        style: TextStyle(
                          color: CustomColors.oxFF4B4B4B,
                          fontSize: 18.sp,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Qisaqacha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.cardBlue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        master.about,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: CustomColors.oxFF4B4B4B,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Xizmatlar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.cardBlue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Wrap(
                        runSpacing: 2.h,
                        spacing: 2.w,
                        children: [
                          ...[
                            for (int i = 0; i < master.skills.length; i++)
                              SkillTile(
                                skill: master.skills[i],
                              ),
                          ]
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Bog’lanish',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.cardBlue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      for (int i = 0; i < master.phoneNumbers.length; i++)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 3.sp,
                            ),
                            Text(
                              master.phoneNumbers[i],
                              style: TextStyle(
                                color: CustomColors.oxFF4B4B4B,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Manzil',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.cardBlue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        master.address,
                        style: TextStyle(
                          color: CustomColors.oxFF4B4B4B,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-5, 0),
                      spreadRadius: 1,
                      blurRadius: 20)
                ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColorButton(
                          color: CustomColors.cardGreen,
                          icon: CustomIcons.phoneIcon,
                          onTap: () {},
                        ),
                        ColorButton(
                          color: CustomColors.cardBlue,
                          icon: CustomIcons.directionIcon,
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
