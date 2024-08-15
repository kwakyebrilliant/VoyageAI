import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final String bookmark;
  DetailScreen({super.key, required this.bookmark});

  final List<Map<String, String>> placeData = [
    {'location': 'London', 'image': 'assets/images/cruise.jpeg'},
    {'location': 'Paris, France', 'image': 'assets/images/mountain.jpeg'},
    {'location': 'Bali', 'image': 'assets/images/place.jpeg'},
    {'location': 'Lesotho', 'image': 'assets/images/flowers.jpeg'},
  ];

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
                  vertical: 2.0,
                  horizontal: 6.0,
                ),
                width: 105.0,
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
                      size: 15.0,
                    ),

                    // Location text here
                    Text(
                      'Paris, France',
                      style: GoogleFonts.inter(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
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
                      style: GoogleFonts.inter(
                        height: 1.1,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '3 Days \n',
                          style: GoogleFonts.inter(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        TextSpan(
                          text: 'Experience at\n',
                          style: GoogleFonts.inter(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        TextSpan(
                          text: 'Paris, France',
                          style: GoogleFonts.inter(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFFF6C00A),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Place data here
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: placeData.map((place) {
                          return Container(
                            padding: const EdgeInsets.all(3.3),
                            margin: const EdgeInsets.only(right: 7.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: const Color(0xFFF6C00A),
                                width: 2.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.srcATop,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25.0),
                                    child: Image.asset(
                                      place['image']!,
                                      height: 130.0,
                                      width: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.location_on_rounded,
                                          color: Color(0xFFFFFFFF),
                                          size: 12.0,
                                        ),
                                        Text(
                                          place['location']!,
                                          style: GoogleFonts.inter(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20.0),
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
