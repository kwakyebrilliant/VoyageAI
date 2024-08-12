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
        // Form container positioned at the top
        Positioned(
          top: 0.0,
          left: 10.0,
          right: 10.0,
          // Form container
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9FA),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),

        // Proceed container positioned at the bottom
        Positioned(
          bottom: 0.0,
          left: 10.0,
          right: 10.0,
          // Proceed container in GestureDetector
          child: GestureDetector(
            onTap: widget.showProceedPage,

            // Proceed container
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color(0xFFF6C00A),
              ),

              // Proceed text centered
              child: Center(
                // Proceed text here
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
