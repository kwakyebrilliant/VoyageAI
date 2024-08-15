import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:voyageai/screens/detail_screen.dart';

class Bookmark extends StatefulWidget {
  final List<String> bookmarks;

  const Bookmark({super.key, required this.bookmarks});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    // Variables
    double bookmarkHeight = 240.0;
    double totalHeight = bookmarkHeight * widget.bookmarks.length;

    return
        // SizedBox for all contents
        SizedBox(
      height: totalHeight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.bookmarks.length,
        padding: const EdgeInsets.only(top: 15.0),
        itemBuilder: (context, index) {
          // Random colors
          Color color = Color.fromARGB(
            255,
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
          );

          return
              // Padding at the bottom of each container
              Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: DetailScreen(bookmark: widget.bookmarks[index]),
                    );
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                ));
              },

              // Row for days container and BookmarkCardClipper
              child: Row(
                children: [
                  // Container for days
                  Container(
                    width: 50.0,
                    height: 220.0,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),

                    // Column starts here
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RotatedBox(
                          quarterTurns: -1,

                          // Travel text
                          child: Text(
                            'TRAVEL',
                            style: GoogleFonts.inter(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),

                        // Column starts here
                        Column(
                          children: [
                            RotatedBox(
                              quarterTurns: -1,

                              // Days text
                              child: Text(
                                'DAYS',
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8.0),

                            // Container for days number
                            Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Center(
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  // Days number
                                  child: Text(
                                    "3",
                                    style: GoogleFonts.inter(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Column ends here
                      ],
                    ),
                    // Column ends here
                  ),
                  const SizedBox(width: 2.0),
                  ClipPath(
                    clipper: BookmarkCardClipper(),
                    child: Container(
                      width: 350.0,
                      height: 220.0,
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF9F9FA),
                        image: DecorationImage(
                          image: AssetImage("assets/images/map.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF494B45).withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      color: Color(0xFFF6C00A),
                                      size: 20.0,
                                    ),
                                    Text(
                                      'Paris, France',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 65.0),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF494B45).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Distance from you',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: widget.bookmarks[index],
                                            style: GoogleFonts.inter(
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'km',
                                            style: GoogleFonts.inter(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 5.0,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Color(0xFFF6C00A),
                                            size: 20.0,
                                          ),
                                          Text(
                                            '4.8 Rating',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFFFFFFFF),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '\$100.',
                                        style: GoogleFonts.inter(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '72',
                                        style: GoogleFonts.inter(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFFFFFFF),
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
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Bookmark card clipper
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
