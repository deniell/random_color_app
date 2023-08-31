import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color_app/utils/utils.dart';

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
  Color backgroundColor = Colors.grey[300] ?? Colors.grey;
  // previous page background color
  Color previousColor = Colors.grey;
  // scale factor for text animation
  double scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    // get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: backgroundColor,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              transform: Matrix4.identity()..scale(scaleFactor),
              transformAlignment: Alignment.center,
              child: Text(
                'Hello there!',
                style: GoogleFonts.aBeeZee(
                  // adopt font size to screen width
                  fontSize: 25 * screenWidth/200,
                  fontWeight: FontWeight.bold,
                  color: previousColor,
                  shadows: [
                    Shadow(
                      blurRadius: 12,
                      color: previousColor,
                      offset: const Offset(10, 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          // start text scale up
          animateText();
          // get random color and update background color with it
          setState(() {
            previousColor = backgroundColor;
            backgroundColor = getRandomColor();
          });
        },
      ),
    );
  }

  ///
  /// Function responsible for text animation
  /// The animation scale up the text and after [delay] scale it down to
  /// default scale factor
  ///
  void animateText() {
    // value which define max text scale up factor
    const scaleUpValue = 2.2;
    // delay in milliseconds, which define when scale up animation will be
    // interrupted and scale down animation will be activated
    const delay = 100;

    // scale up text
    setState(() {
      scaleFactor = scaleUpValue;
    });
    // return text to initial size
    Future.delayed(const Duration(milliseconds: delay), () {
      setState(() {
        scaleFactor = 1.0;
      });
    });
  }
}
