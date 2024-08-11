import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoBookmark extends StatefulWidget {
  const NoBookmark({super.key});

  @override
  State<NoBookmark> createState() => _NoBookmarkState();
}

class _NoBookmarkState extends State<NoBookmark> {
  // GIF list
  final List<String> gifData = [
    'assets/images/travel.gif',
    'assets/images/travel2.gif',
    'assets/images/travel3.gif',
    'assets/images/travel4.gif',
  ];

  // variable
  late String selectedGif;

  @override
  void initState() {
    super.initState();
    // Select a random GIF when the widget is initialized
    final random = Random();
    selectedGif = gifData[random.nextInt(gifData.length)];
  }

  @override
  Widget build(BuildContext context) {
    // Container for all contents
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 320.0,
      width: 320.0,
      decoration: BoxDecoration(
        color: const Color(0xFF494B45).withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.0),
      ),

      // Column starts here
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // First text
          Text(
            'No planned travels yet...',
            style: GoogleFonts.inter(
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),

          // Second text
          Text(
            textAlign: TextAlign.center,
            'Plan your travels with this AI enhanced application',
            style: GoogleFonts.inter(
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.w300,
              fontSize: 14.0,
            ),
          ),

          // Display the selected GIF here
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image.asset(
              selectedGif,
              height: 180.0,
              width: 180.0,
            ),
          ),
        ],
      ),
      // Column ends here
    );
  }
}
