import 'dart:io';

import 'package:flutter/material.dart';

///
/// Generate and return random Color
/// 
Color getRandomColor() {
  // the alpha value, with 0 being transparent and 255 being fully opaque.
  const int opacity = 255;

  // construct a color from the lower 8 bits of four integers
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
  // list for random 8 bit
  final List<int> listOfBits = [];
  // bits to be added to the list
  const int bitsToAdd = 8;

  // loop for filling listOfBits with 8 random bits
  for (int counter = 0; counter < bitsToAdd; counter++) {
    final bit = getRandomBit();
    listOfBits.add(bit);
  }

  // convert bits to integer value
  final int intValue = bitsToInt(listOfBits);
  
  return intValue;
}

///
/// Return random bit
/// This function contain main randomness logic. Current realization do not use
/// any external (even dart:math) library, but can be sufficiently improved with
/// use of them.
///
int getRandomBit() {
  // try to get random value from DateTime
  final now = DateTime.now().microsecondsSinceEpoch;
  // get hash from current DateTime, to have even more random value
  final hash = now.hashCode;
  // convert hash value to bit value (int 0 or 1)
  final int bit = hash % 2;

  return bit;
}

///
/// Convert list of bits to [bits].length integer value
///
int bitsToInt(List<int> bits) {
  // initial result
  int result = 0;
  // set given bits to result value
  for (final int bit in bits) {
    result = (result << 1) | bit;
  }

  return result;
}

///
/// Function which help identify on which platform the app currently runs
///
bool isMobile() {
  return Platform.isIOS || Platform.isAndroid;
}
