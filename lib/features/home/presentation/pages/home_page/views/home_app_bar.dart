import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:markab/config/core/constants/colors.dart';
import 'package:markab/config/core/routes/route.dart';

import '../../notification_page/notification_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.blue.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            onTap: () {
              context.pushNamed(Routes.settingsPage);
            },
            child: SvgPicture.asset(
              "assets/icons/ic_settings.svg",
              height: 20.sp,
              width: 19.sp,
            ),
          ),
        ),
        Badge(
          offset: const Offset(6, -10),
          backgroundColor: CustomColors.oxFFEF5454,
          label: Text(
            "12",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: CustomColors.oxFFFCFCFC,
            ),
          ),
          largeSize: 18,
          alignment: AlignmentDirectional.topEnd,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.blue.shade100,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
              child: SvgPicture.asset(
                "assets/icons/ic_bell.svg",
                height: 28,
                width: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
