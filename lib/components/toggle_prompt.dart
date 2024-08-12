import 'package:flutter/material.dart';
import 'package:voyageai/utility/input_page.dart';
import 'package:voyageai/utility/proceed_page.dart';

class TogglePrompt extends StatefulWidget {
  const TogglePrompt({super.key});

  @override
  State<TogglePrompt> createState() => _TogglePromptState();
}

class _TogglePromptState extends State<TogglePrompt> {
  bool _showInputPage = true;

  void _togglePrompt() {
    setState(() {
      _showInputPage = !_showInputPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showInputPage) {
      return InputPage(
        showProceedPage: _togglePrompt,
      );
    } else {
      return ProceedPage(
        showInputPage: _togglePrompt,
      );
    }
  }
}
