import 'package:flutter/material.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          text: "Tilni o'zgartirish",
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
