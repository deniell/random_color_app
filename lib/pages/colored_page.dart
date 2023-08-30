import 'package:flutter/material.dart';

///
/// Main app page, with background color randomly generated
///
class ColoredPage extends StatefulWidget {
  const ColoredPage({super.key});

  @override
  _ColoredPageState createState() => _ColoredPageState();
}

class _ColoredPageState extends State<ColoredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello there',
        ),
      ),
    );
  }
}
