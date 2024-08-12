import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProceedPage extends StatefulWidget {
  final VoidCallback showInputPage;
  const ProceedPage({super.key, required this.showInputPage});

  @override
  State<ProceedPage> createState() => _ProceedPageState();
}

class _ProceedPageState extends State<ProceedPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0.0,
          left: 10.0,
          right: 10.0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: const Color(0xFFF6C00A),
            ),

            // Submit text centered
            child: Center(
              // Submit text here
              child: Text(
                'Submit',
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
