import 'package:flutter/material.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          text: 'Ulashish',
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
