import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPage extends StatefulWidget {
  final VoidCallback showProceedPage;
  const InputPage({super.key, required this.showProceedPage});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0.0,
          left: 10.0,
          right: 10.0,
          child: GestureDetector(
            onTap: widget.showProceedPage,
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
                  'Proceed',
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
