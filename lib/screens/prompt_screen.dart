import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyageai/components/toggle_prompt.dart';

class PromptScreen extends StatefulWidget {
  final VoidCallback showHomeScreen;
  const PromptScreen({super.key, required this.showHomeScreen});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: CustomScrollView(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 180.0,
                child: const TogglePrompt(),
              ),
            ),
          ),
        ],
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
          onPressed: widget.showHomeScreen,

          // home icon here
          child: const Icon(
            Icons.home_rounded,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
