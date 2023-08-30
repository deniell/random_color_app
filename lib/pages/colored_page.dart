import 'package:flutter/material.dart';

class ColoredPage extends StatefulWidget {
  const ColoredPage({Key? key}) : super(key: key);

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
