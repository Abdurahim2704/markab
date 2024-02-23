import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/core/constants/colors.dart';
import '../../../../../config/core/constants/icons.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 10.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.textfieldGrey, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: CustomColors.textfieldGrey, width: 1),
        ),
        focusColor: Colors.transparent,
        suffixIcon: IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          icon: Container(
            height: 15.sp,
            width: 15.sp,
            margin: EdgeInsets.symmetric(
              horizontal: 7.sp,
              vertical: 7.sp,
            ),
            child: Image.asset(
              CustomIcons.filterIcon,
              height: 15.sp,
              width: 15.sp,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFF0F0F0), width: 1.sp),
          borderRadius: BorderRadius.all(
            Radius.circular(8.sp),
          ),
        ),
        hintText: "Qidirish",
        hintStyle: TextStyle(
          color: const Color(0xFFE0E0E0),
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.zero,
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Container(
            height: 12.sp,
            width: 12.sp,
            margin: EdgeInsets.symmetric(
              horizontal: 7.sp,
              vertical: 7.sp,
            ),
            child: Image.asset(
              CustomIcons.searchIcon,
              height: 15.sp,
              width: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
