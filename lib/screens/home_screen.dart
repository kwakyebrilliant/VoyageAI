import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyageai/components/no_bookmark.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback showPromptScreen;
  const HomeScreen({super.key, required this.showPromptScreen});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Simulate a list of bookmarks (empty or with items)
  final List<String> bookmarks = ["Bookmark 1", "Bookmark 2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      // Container for entire contents
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // Background image here
            image: AssetImage(
              "assets/images/background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),

        // Padding around contents
        child: Padding(
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
                  children: bookmarks.isEmpty
                      ? const [NoBookmark()]
                      : [
                          BookmarkCardContainer(),
                        ],
                ),
              ),
            ],
          ),
          // Column ends here
        ),
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

class BookmarkCardContainer extends StatelessWidget {
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    Color color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    return Row(
      children: [
        Container(
          width: 50.0,
          height: 220.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
          child: const Center(
            child: Text('data'),
          ),
        ),
        ClipPath(
          clipper: BookmarkCardClipper(),
          child: Container(
            width: 320.0,
            height: 220.0,
            color: const Color(0xFFF6C00A),
            child: Center(
              child: Text(
                'Bookmark',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BookmarkCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cornerRadius = 20.0;
    Path path = Path();
    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, 0, 0);
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);
    path.lineTo(size.width, size.height - cornerRadius * 3);
    path.lineTo(size.width - cornerRadius * 3, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
