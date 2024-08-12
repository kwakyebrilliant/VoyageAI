import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookmark extends StatefulWidget {
  final List<String> bookmarks;

  const Bookmark({super.key, required this.bookmarks});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  // random object
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    double bookmarkHeight = 240.0;
    double totalHeight = bookmarkHeight * widget.bookmarks.length;

    return
        // Sizedbox for all bookmarks
        SizedBox(
      height: totalHeight,

      // This creates a scrollable list of widgets
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.bookmarks.length,
        padding: const EdgeInsets.only(top: 15.0),
        itemBuilder: (context, index) {
          // Random generated colors
          Color color = Color.fromARGB(
            255,
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
          );

          // Padding around the content
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),

            // Row for both containers at the left and right
            child: Row(
              children: [
                // Container for days of travel
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
                        child: Text(
                          'TRAVEL',
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          RotatedBox(
                            quarterTurns: -1,
                            // Day or days text
                            child: Text(
                              'DAYS',
                              style: GoogleFonts.inter(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 8.0,
                          ),

                          // Container for the number of days
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
                    ],
                  ),
                ),
                // Column ends here

                const SizedBox(
                  width: 2.0,
                ),

                ClipPath(
                  clipper: BookmarkCardClipper(),
                  child: Container(
                    width: 350.0,
                    height: 220.0,
                    padding: const EdgeInsets.all(10.0),
                    color: const Color(0xFFF9F9FA),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6.0,
                                horizontal: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF494B45).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6.0,
                                horizontal: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF494B45).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xFFF6C00A),
                                    size: 20.0,
                                  ),
                                  Text(
                                    '4.8',
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
                        const SizedBox(
                          height: 100.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.bookmarks[index],
                              style: GoogleFonts.inter(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
