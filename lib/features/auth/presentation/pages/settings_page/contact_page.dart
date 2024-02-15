import 'package:flutter/material.dart';
import 'package:markab/shared/widgets/appbar_title.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          text: "Bo'g'lanish",
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
