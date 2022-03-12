import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Green Screen'),),
      body: const Text('green screen'),
    );
  }
}
