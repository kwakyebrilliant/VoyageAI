import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback showPromptScreen;
  const HomeScreen({super.key, required this.showPromptScreen});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> gifData = [
    'assets/images/travel.gif',
    'assets/images/travel2.gif',
    'assets/images/travel3.gif',
    'assets/images/travel4.gif',
  ];

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
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      // Padding around contents
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0),

        // Column starts here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // RichText in an align widget
            Align(
              alignment: Alignment.center,

              // RichText for logo
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'voyage',
                      style: GoogleFonts.roboto(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    TextSpan(
                      text: 'ai',
                      style: GoogleFonts.inter(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFF6C00A),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Expanded here
            Expanded(
              // Column starts here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 320.0,
                    width: 320.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF494B45).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'No planned travels yet...',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Your smart travel companion all enhanced by AI',
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
                  ),
                ],
              ),
            ),
          ],
        ),
        // Column ends here
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF6C00A).withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          onPressed: widget.showPromptScreen,
          child: const Icon(
            Icons.mode_of_travel_outlined,
          ),
        ),
      ),
    );
  }
}
