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
    "bookmarks 1",
    "bookmarks 2",
    "bookmarks 3",
    "bookmarks 4",
    "bookmarks 5",
    "bookmarks 6",
    "bookmarks 7",
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: bookmarks.isEmpty
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
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF6C00A).withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          onPressed: widget.showPromptScreen,
          child: const Icon(
            Icons.mode_of_travel_rounded,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
