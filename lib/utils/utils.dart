import 'dart:math';
import 'package:flutter/material.dart';

///
/// Generate and return random Color
/// 
Color? getRandomColor() {
  // the alpha value, with 0 being transparent and 255 being fully opaque.
  const int opacity = 255;

  return Color.fromARGB(
    opacity,
    getRandom8BitNumber(),
    getRandom8BitNumber(),
    getRandom8BitNumber(),
  );
}

///
/// Return random 8 bit number (int in diapason from 0 to 255)
///
int getRandom8BitNumber() {
  return Random().nextInt(256);
}
