import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  final VoidCallback showProceedSceen;
  const MyWidget({super.key, required this.showProceedSceen});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
