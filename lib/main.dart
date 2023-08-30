import 'package:flutter/material.dart';
import 'package:random_color_app/pages/colored_page.dart';

void main() {
  runApp(const RandomColorApp());
}

class RandomColorApp extends StatelessWidget {
  const RandomColorApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Color App',
      debugShowCheckedModeBanner: false,
      home: const ColoredPage(),
    );
  }
}

