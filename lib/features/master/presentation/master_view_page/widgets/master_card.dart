import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/features/auth/data/models/mechanic.dart';

import '../../../../../config/core/constants/colors.dart';

class MasterCard extends StatelessWidget {
  final Mechanic master;
  const MasterCard({super.key, required this.master});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.sp))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                minRadius: 30,
                child: Image.network("https://via.placeholder.com/44x44"),
              ),
              SizedBox(
                width: 8.w,
              ),
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
                            for (int i = 0; i < master.grade.toInt(); i++)
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFE925),
                                size: 12.sp,
                              ),
                            for (int i = 0; i < (5 - master.grade.toInt()); i++)
                              Icon(
                                Icons.star,
                                size: 12.sp,
                                color: Color(0xFFE5F0FF),
                              )
                          ]
                        ],
                      ),
                    ),
                    Text(
                      master.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColors.oxFF4B4B4B,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      master.address,
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
            master.about,
            style: TextStyle(
              color: const Color(0xFFA0A0A0),
              fontSize: 10.sp,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w300,
              height: 1.2,
            ),
            maxLines: 2,
          ),
          SizedBox(
            height: 12.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runSpacing: 2.h,
              spacing: 2.w,
              children: [
                ...[
                  for (int i = 0; i < master.skills.length; i++)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE5F0FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.sp)),
                      ),
                      child: Text(
                        master.skills[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF366AD2),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
