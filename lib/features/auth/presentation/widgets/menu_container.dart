import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
    child: Container(
      width: double.infinity,
      height: 155,
decoration: BoxDecoration(
  border: Border.all(color: CupertinoColors.systemYellow),
  borderRadius: BorderRadius.circular(8),
  color: Colors.black12,
),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(15),
          child: TextField(
            style: TextStyle(color: CupertinoColors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CupertinoColors.systemYellow)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CupertinoColors.systemYellow),
              ),
              suffixIcon: Icon(Icons.favorite_outline, color: Colors.grey,),
              prefixIcon: Icon(Icons.search, color: Colors.grey,),
              hintText: "Where would you go",
              hintStyle: TextStyle(color: Color(0xffd0d0d0), fontSize: 16, fontWeight: FontWeight.w500)
            ),
          ),),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),child: ToggleSwitch(
          activeBgColor: [CupertinoColors.systemYellow],
            inactiveBgColor: Colors.blueGrey,
            inactiveFgColor: CupertinoColors.white,
            minHeight: 48,
            minWidth: 160,
            initialLabelIndex: 0,
            totalSwitches: 2,
            labels: [
              "Transport",
              "Delivery"
            ],
          ),)
        ],
      ),
    ),);
  }
}
