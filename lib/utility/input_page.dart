import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class City {
  final String name;
  final String country;

  City({required this.name, required this.country});
}

class InputPage extends StatefulWidget {
  final VoidCallback showProceedPage;
  const InputPage({super.key, required this.showProceedPage});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? _selectedCountry;
  String? _selectedCountryCode;
  City? _selectedCity;
  String _selectedOption = 'Set Budget';
  double _minBudget = 0;
  double _maxBudget = 1000;

  final String _apiKey = '';

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country.name;
          _selectedCountryCode = country.countryCode;
        });
      },
    );
  }

  Future<List<City>> _fetchCities(String query) async {
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/find?q=$query,$_selectedCountryCode&appid=$_apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['list'] != null) {
        return List<City>.from(
          data['list'].map((city) => City(
                name: city['name'],
                country: city['sys']['country'],
              )),
        );
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    // Stack for all content
    return Stack(
      children: [
        // Container positioned at the top
        Positioned(
          top: 0.0,
          left: 10.0,
          right: 10.0,

          // Container for forms
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9FA),
              borderRadius: BorderRadius.circular(20.0),
            ),

            // Column starts here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header and sub-header text aligned center
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Next Travel?\n',
                          style: GoogleFonts.roboto(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        const WidgetSpan(
                          child: SizedBox(height: 30.0),
                        ),
                        TextSpan(
                          text:
                              'Plan your next travel with voyageAI and get \n',
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF494B45),
                          ),
                        ),
                        TextSpan(
                          text: 'the best budget friendly destinations \n',
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF494B45),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Padding around column for country and city select
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Select destination text
                      Text(
                        'SELECT DESTINATION',
                        style: GoogleFonts.roboto(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF000000),
                        ),
                      ),

                      // Padding around country select
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 10.0,
                          right: 10.0,
                        ),

                        // Container for country select in GestureDetector
                        child: GestureDetector(
                          onTap: _showCountryPicker,

                          // Container for country select
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 10.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color(0xFFFFFFFF),
                              border: Border.all(
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selectedCountry ?? 'Select Country',
                                  style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF494B45),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFF494B45),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // padding around typeaheadfield
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 10.0,
                          right: 10.0,
                        ),

                        // Typeaheadfield here
                        child: TypeAheadField<City>(
                          suggestionsCallback: (pattern) async {
                            if (_selectedCountryCode == null ||
                                pattern.isEmpty) {
                              return [];
                            }
                            try {
                              final cities = await _fetchCities(pattern);
                              return cities
                                  .where((city) => city.name
                                      .toLowerCase()
                                      .contains(pattern.toLowerCase()))
                                  .toList();
                            } catch (e) {
                              print('Error fetching cities: $e');
                              return [];
                            }
                          },
                          builder: (context, controller, focusNode) {
                            // Container for textfield in typeaheadfield
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: const Color(0xFFFFFFFF),
                                border: Border.all(
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),

                              // Textfield here
                              child: TextField(
                                controller: controller,
                                focusNode: focusNode,
                                autofocus: true,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelText: 'City',
                                  labelStyle: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF494B45),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemBuilder: (context, city) {
                            // Listtile to display the city in typeaheadfield
                            return ListTile(
                              tileColor: const Color(0xFFFFFFFF),
                              title: Text(
                                city.name,
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF494B45),
                                ),
                              ),
                              subtitle: Text(
                                city.country,
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xFF494B45),
                                ),
                              ),
                            );
                          },
                          onSelected: (city) {
                            setState(() {
                              _selectedCity = city;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Padding around budget
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<String>(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        value: _selectedOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue!;
                          });
                        },
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        dropdownColor: const Color(0xFFFFFFFF),
                        items: <String>['Set Budget', 'Enter Budget']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.inter(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF494B45),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 5.0),
                      if (_selectedOption == 'Set Budget')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RangeSlider(
                              activeColor: const Color(0xFFF6C00A),
                              inactiveColor:
                                  const Color(0xFF494B45).withOpacity(0.2),
                              values: RangeValues(_minBudget, _maxBudget),
                              min: 0,
                              max: 10000,
                              divisions: 100,
                              labels: RangeLabels(
                                '\$${_minBudget.round()}',
                                '\$${_maxBudget.round()}',
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _minBudget = values.start;
                                  _maxBudget = values.end;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                '\$${_minBudget.round()} - \$${_maxBudget.round()}',
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF494B45),
                                ),
                              ),
                            ),
                          ],
                        )
                      else if (_selectedOption == 'Enter Budget')
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color(0xFFFFFFFF),
                              border: Border.all(
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),

                            // Textfield here
                            child: TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                labelText: 'Enter your budget',
                                labelStyle: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF494B45),
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Proceed button positioned at the bottom
        Positioned(
          bottom: 0.0,
          left: 10.0,
          right: 10.0,

          // Proceed button in GestureDetector
          child: GestureDetector(
            onTap: widget.showProceedPage,

            // Proceed button container
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color(0xFFF6C00A),
              ),

              // Proceed button text centered
              child: Center(
                // Proceed button text
                child: Text(
                  'Proceed',
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
