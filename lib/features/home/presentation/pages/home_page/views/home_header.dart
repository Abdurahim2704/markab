import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'car_adding_container.dart';
import 'header_indicator.dart';
import 'home_header_container.dart';

class HomeScreenHeader extends StatefulWidget {
  const HomeScreenHeader({Key? key}) : super(key: key);

  @override
  State<HomeScreenHeader> createState() => _HomeScreenHeaderState();
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 190.h,
          width: 266.w,
          padding: EdgeInsets.symmetric(
            horizontal: 5.0.h,
            vertical: 5.0.h,
          ),
          child: PageView.builder(
            clipBehavior: Clip.antiAlias,
            scrollDirection: Axis.horizontal,
            allowImplicitScrolling: true,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              return index == 0
                  ? const HomeHeaderContainer()
                  : const CarrAddContainer();
            },
          ),
        ),
        SizedBox(height: 15.h),
        HeaderPageIndicator(currentPage: _currentPage),
      ],
    );
  }
}
