import 'package:flutter/material.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

class ChangeThemePage extends StatelessWidget {
  const ChangeThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          text: 'Rejim',
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
