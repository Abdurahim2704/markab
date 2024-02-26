import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';

void showCarInputDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) => AlertDialog(
      alignment: Alignment.topCenter,
      title: Text(
        'Add Car',
        style: TextStyle(
          fontFamily: "Proxima Nova",
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
          color: CustomColors.oxFF000000,
        ),
      ),
      content: SizedBox(
        width: 200.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Car Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              decoration: InputDecoration(
                hintText: 'Car Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Submit'),
          child: const Text('Submit'),
        ),
      ],
    ),
  );
}
