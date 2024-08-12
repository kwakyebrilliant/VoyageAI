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
  final List<String> bookmarks = [
    "46.3",
    "300.12",
    "12.04",
    "72.10",
    "500.57",
    "162.18",
    "14.92",
  ];

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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xFFFFFFFF),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                // RichText for logo
                title: RichText(
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
              floating: true,
              snap: true,
              expandedHeight: 80.0,
              collapsedHeight: 52.0,
              toolbarHeight: 52.0,
              pinned: true,
            ),
            // SliverToBoxAdapter for contents
            SliverToBoxAdapter(
              // Padding around sizedbox containing bookmarks or no bookmarks
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: bookmarks.isEmpty

                    // Sizedbox containing bookmarks or no bookmarks
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height -
                            kToolbarHeight -
                            80.0,
                        child: const Center(
                          child: NoBookmark(),
                        ),
                      )
                    : Bookmark(bookmarks: bookmarks),
              ),
            ),
          ],
        ),
      ),

      // Container around floatingActionButton
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF6C00A).withOpacity(0.8),
          shape: BoxShape.circle,
        ),

        // FloatingActionButton here
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          onPressed: widget.showPromptScreen,

          // add_location icon here
          child: const Icon(
            Icons.add_location_alt_outlined,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
