import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/config/core/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Xabarlar',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            fontFamily: "Proxima Nova",
            color: CustomColors.oxFF2F80ED,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              /// #Notification Case
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.r),
                        ),
                        side: const BorderSide(color: Color(0xFFDADADA)),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jarima",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: CustomColors.oxFF2F80ED,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          Text(
                            "Tezlikni oshirish (20 km-dan kup bulmagan)",
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: CustomColors.oxFF4B4B4B,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          Text(
                            "20.11.2023",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: CustomColors.oxFF4B4B4B,
                            ),
                          ),
                        ],
                      ),
                      trailing: SvgPicture.asset(
                        "assets/icons/ic_penalty_notification.svg",
                        height: 22.sp,
                        width: 18.sp,
                      ),
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
