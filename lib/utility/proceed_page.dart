import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProceedPage extends StatefulWidget {
  final VoidCallback showInputPage;
  const ProceedPage({super.key, required this.showInputPage});

  @override
  State<ProceedPage> createState() => _ProceedPageState();
}

class _ProceedPageState extends State<ProceedPage> {
  // Genre list
  final List<String> interests = [
    'Cultural Heritage',
    'Adventure Sports',
    'Culinary Exploration',
    'Beach Relaxation',
    'Nature & Wildlife',
    'Urban Exploration',
    'Wellness & Spa',
    'Nightlife & Entertainment',
    'Art & Creativity',
    'Festivals & Events',
    'Photography',
    'Historical Tours',
    'Religious',
    'Shopping & Fashion',
    'Family-Friendly Activities',
  ];

  // Selected genres list
  final Set<String> _selectedInterests = {};

  @override
  Widget build(BuildContext context) {
    // Stack for all content
    return Stack(
      children: [
        // Navigate back container, header text and list of interets positioned at the top
        Positioned(
          top: 0.0,
          left: 10.0,
          right: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: widget.showInputPage,
                child: Container(
                  height: 30,
                  width: 30.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF6C00A),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_left_rounded,
                    size: 30.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      height: 1.1,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Select \n',
                        style: GoogleFonts.inter(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      TextSpan(
                        text: 'Your Travel \n',
                        style: GoogleFonts.inter(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      TextSpan(
                        text: 'Interest',
                        style: GoogleFonts.inter(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Padding around various genres in a wrap
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 20.0,
                ),

                // Wrap starts here
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Wrap(
                      children: interests.map((interest) {
                        final isSelected =
                            _selectedInterests.contains(interest);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedInterests.contains(interest)) {
                                _selectedInterests.remove(interest);
                              } else {
                                _selectedInterests.add(interest);
                              }
                            });
                          },

                          // Container with border around each genre
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            margin:
                                const EdgeInsets.only(right: 10.0, top: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xFFF9F9FA),
                            ),

                            // Container for each genre
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFF6C00A)
                                    : const Color(0xFFFFFFFF).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(20.0),
                              ),

                              // Text for each genre
                              child: Text(
                                interest,
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                // Wrap ends here
              ),
            ],
          ),
        ),

        // Submit button positioned at the bottom
        Positioned(
          bottom: 0.0,
          left: 10.0,
          right: 10.0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: const Color(0xFFF6C00A),
            ),

            // Submit text centered
            child: Center(
              // Submit text here
              child: Text(
                'Submit',
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
