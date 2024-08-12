import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  final VoidCallback showProceedPage;
  const InputPage({super.key, required this.showProceedPage});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
