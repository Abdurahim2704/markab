import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/location/location_bloc.dart';

class MenuContainer extends StatelessWidget {
  final Function() function;
  final TextEditingController? controller;

  const MenuContainer({super.key, this.controller, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemYellow),
          borderRadius: BorderRadius.circular(8),
          color: Colors.black12,
        ),
        child: TextField(
          controller: controller,
          style: TextStyle(color: CupertinoColors.white),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CupertinoColors.systemYellow)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CupertinoColors.systemYellow),
              ),
              suffixIcon: Icon(
                Icons.favorite_outline,
                color: Colors.grey,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: "Where would you go",
              hintStyle: TextStyle(
                  color: Color(0xffd0d0d0),
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          onSubmitted: (value) {
            function();
            String srteet = controller?.text.split(' ').join("+") ?? "";
            BlocProvider.of<LocationBloc>(context)
                .add(GetLocationByAddressEvent(address: srteet));
          },
        ),
      ),
    );
  }
}
