import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final String bookmark;
  const DetailScreen({super.key, required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      // Body here
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFFFFFFF),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/map.png",
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              // Location container
              title: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 10.0,
                ),
                width: 125.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF494B45).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                // Location icon and text in a row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Location icon
                    const Icon(
                      Icons.location_on_rounded,
                      color: Color(0xFFF6C00A),
                      size: 20.0,
                    ),

                    // Location text here
                    Text(
                      'Paris, France',
                      style: GoogleFonts.inter(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w300,
                        fontSize: 14.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            floating: true,
            snap: true,
            expandedHeight: 120.0,
            collapsedHeight: 52.0,
            toolbarHeight: 52.0,
            pinned: true,
            automaticallyImplyLeading: false,

            // Close and remove bookmark iconbutton in a row
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Close iconbutton
                IconButton(
                  icon: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFF0000),
                      border: Border.all(
                        color: const Color(0xFF494B45).withOpacity(0.2),
                        width: 0.2,
                      ),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFFFFFFFF),
                      size: 30.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

                // Remove bookmark iconbutton
                IconButton(
                  icon: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF494B45).withOpacity(0.7),
                      border: Border.all(
                        color: const Color(0xFF494B45).withOpacity(0.2),
                        width: 0.2,
                      ),
                    ),
                    child: const Icon(
                      Icons.bookmark_remove_rounded,
                      color: Color(0xFFFFFFFF),
                      size: 23.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // SliverToBoxAdapter for other contents
          SliverToBoxAdapter(
            // Padding around contents
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 10.0,
                right: 10.0,
              ),

              // Column starts here
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header text
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        height: 1.1,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'For your 3 days experience to \n',
                          style: GoogleFonts.poppins(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        TextSpan(
                          text: 'Paris, France',
                          style: GoogleFonts.poppins(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFF6C00A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    bookmark,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Column ends here
            ),
          ),
        ],
      ),
    );
  }
}
