import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyageai/components/bookmark.dart';
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
                          const Bookmark(),
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
