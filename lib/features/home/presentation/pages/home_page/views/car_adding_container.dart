import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/config/core/constants/colors.dart';

import 'car_input_dialog.dart';

class CarrAddContainer extends StatefulWidget {
  const CarrAddContainer({super.key});

  @override
  State<CarrAddContainer> createState() => _CarrAddContainerState();
}

class _CarrAddContainerState extends State<CarrAddContainer> {
  TextEditingController carNameController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.0.sp,
        vertical: 5.0.sp,
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
          colors: [
            const Color(0xff0500FC).withOpacity(0.2),
            CustomColors.oxFFFFFFFF.withOpacity(0.0),
            CustomColors.oxFF366AD2.withOpacity(0.2),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.oxFF366AD2.withOpacity(0.1),
            CustomColors.oxFFFFFFFF.withOpacity(0.0),
            CustomColors.oxFF366AD2.withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30.sp),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28.sp,
            child: IconButton(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
              iconSize: 38.sp,
              onPressed: () {
                showCarInputDialog(context);
              },
              icon: const Icon(
                Icons.add,
                color: CustomColors.oxFF2F80ED,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Mashina qo’shish",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: CustomColors.oxFFFFFFFF,
              fontFamily: "Proxima Nova",
            ),
          ),
        ],
      ),
    );
  }
}
