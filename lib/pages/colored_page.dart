import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// Main app page, with background color randomly generated
///
class ColoredPage extends StatefulWidget {
  const ColoredPage({super.key});

  @override
  _ColoredPageState createState() => _ColoredPageState();
}

class _ColoredPageState extends State<ColoredPage> {
  // page background color
  Color? backgroundColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    // get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Text(
              'Hello there',
              style: GoogleFonts.aBeeZee(
                // adopt font size to screen width
                fontSize: 25 * screenWidth/200,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        onTap: () {
          print('Color have to be changed');
        },
      ),
    );
  }
}
