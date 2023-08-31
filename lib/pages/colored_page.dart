import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color_app/utils/dialogs.dart';
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
    // get media query data
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    // get screen width
    final screenWidth = mediaQuery.size.width;
    // get status bar height
    final statusBarHeight = mediaQuery.viewPadding.top;

    // animated text for center of the page
    final Widget animatedText = AnimatedContainer(
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
              offset: isMobile()
                  ? const Offset(3, 3)
                  : const Offset(10, 10),
            ),
          ],
        ),
      ),
    );

    // animated colored container
    final Widget animatedContainer = GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: backgroundColor,
        child: Center(
          child: animatedText,
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
    );

    // close button for mobile devices
    final Widget closeButton = Positioned(
      top: statusBarHeight,
      right: 0,
      child: IconButton(
        padding: const EdgeInsets.all(15),
        icon: const Icon(
          Icons.close,
          color: Colors.white70,
          size: 26,
        ),
        onPressed: () {
          // show exit dialog
          exitDialog(context: context);
        },
      ),
    );

    return WillPopScope(
      onWillPop: () {
        if (isMobile()) {
          // show exit dialog
          exitDialog(context: context);

          // do not close the app when use click back button on Android
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            animatedContainer,
            if (isMobile()) closeButton else Container(),
          ],
        ),
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
