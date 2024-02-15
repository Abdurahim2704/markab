import 'package:flutter/material.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          text: 'FAQ',
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
