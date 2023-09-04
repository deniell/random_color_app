import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
/// Generate and return random Color
/// 
Future<Color> getRandomColor() async {
  // the alpha value, with 0 being transparent and 255 being fully opaque.
  const int opacity = 255;

  // list, filled with randomly generated 8 bits values for basic colors
  final List<int> colorValues = [
    await getRandom8BitNumber(),
    await getRandom8BitNumber(),
    await getRandom8BitNumber(),
  ];

  // order numbers, which represents in which order we will add color values
  // from [colorValues] list above to Color class when creating a Color object
  List<int> orderNumbers = [];

  // get random integer value
  int randomInt = await getRandomInt();

  // loop intended to make order, for assigning colors in Color object, random
  while (randomInt > 0) {
    // print('hash: $randomInt');
    // get integer value in diapason from 0 to 2 by taking the remainder from
    // division of the random integer value
    final int number = randomInt % 3;
    // stop when orderNumbers list is filled with values
    if (orderNumbers.length == 3) {
      break;
    }
    // add unique order number to the [orderNumbers] list
    if (!orderNumbers.contains(number)) {
      orderNumbers.add(number);
    }
    // gradually reduce random integer value
    randomInt ~/= 2;
  }
  // print("order numbers: $orderNumbers");

  // for case when order numbers was not assigned correctly in random order,
  // assign them in normal order
  if (orderNumbers.length < 3) {
    orderNumbers = [0, 1, 2];
  }

  // int value for red color
  final int red = colorValues[orderNumbers[0]];
  // int value for green color
  final int green = colorValues[orderNumbers[1]];
  // int value for blue color
  final int blue = colorValues[orderNumbers[2]];
  // print('red: $red, green: $green, blue: $blue');

  // construct a color from the lower 8 bits of four integers
  return Color.fromARGB(
    opacity,
    red,
    green,
    blue,
  );
}

///
/// Return random 8 bit number (int in diapason from 0 to 255)
///
Future<int> getRandom8BitNumber() async {
  // list for random 8 bit
  final List<int> listOfBits = [];
  // bits to be added to the list
  const int bitsToAdd = 8;

  // loop for filling listOfBits with 8 random bits
  for (int counter = 0; counter < bitsToAdd; counter++) {
    // get random integer value
    int randomInt = await getRandomInt();
    // print('hash: $randomInt');
    // get less significant bit value, by taking the
    // remainder when dividing given integer value by 2 (0 or 1)
    final int bit = randomInt % 2;
    // converting an integer to its binary representation by repeatedly
    // dividing it by 2
    randomInt ~/= 2;
    // add calculated bit to the list
    listOfBits.add(bit);
  }

  // convert bits to integer value
  final int intValue = bitsToInt(listOfBits);

  return intValue;
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
/// Get random integer number
///
Future<int> getRandomInt() async {
  // delay, to be sure that we get DataTime object, which differ from previous
  // required for web, other platforms works fine without this delay
  await Future.delayed(const Duration(milliseconds: 1));
  // get random integer value with use of DateTime class
  final now = DateTime.now().millisecondsSinceEpoch;
  // get hash from current DateTime
  final int hash = now.hashCode;

  return hash;
}


///
/// Function which help identify on which platform the app currently runs
///
bool isMobile() {
  if (kIsWeb) {
    // check first if the app run on web,
    // as Platform check is not supported on web
    return false;
  } else if (Platform.isIOS || Platform.isAndroid) {
    return true;
  } else {
    return false;
  }
}
