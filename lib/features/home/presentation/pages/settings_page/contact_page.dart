import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

import '../../../../../config/core/constants/colors.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackground,
      appBar: AppBar(
        title: const AppBarTitle(
          text: "Bo'g'lanish",
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
      body: const Column(
        children: [],
      ),
    );
  }
}
