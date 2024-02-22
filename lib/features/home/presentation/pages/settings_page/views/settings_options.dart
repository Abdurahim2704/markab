import 'package:flutter/material.dart';

class SettingsOption {
  String title;
  String icon;
  void Function()? onClick;
  Widget? trailing;

  SettingsOption.arrow({
    required this.title,
    required this.icon,
    this.onClick,
    this.trailing,
  });
}
