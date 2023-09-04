import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_app/utils/utils.dart';

void main() {
  ///
  /// Helper function, for tests only
  /// Convert the integer value back to a list of bits
  /// Works for 8 bits integers only
  ///
  List<int> intToBits(int value) {
    // number of bits to be added
    const int numberOfBits = 8;
    // list of bits
    final List<int> bits = [];
    // add bits from given value to the list
    for (int i = numberOfBits - 1; i >= 0; i--) {
      bits.add((value >> i) & 1);
    }

    return bits;
  }

  group("getRandomInt()", () {
    test('returns an integer', () async {
      final randomInt = await getRandomInt();
      expect(randomInt, isA<int>());
    });
  });

  group("bitsToInt(List<int> bits)", () {
    test('Converts list of bits to integer value', () {
      List<int> bits = [1, 0, 1, 1, 0, 1];
      int result = bitsToInt(bits);
      expect(result, 45);

      bits = [1, 0, 1, 1, 0, 1, 1, 0];
      result = bitsToInt(bits);
      expect(result, 182);

      bits = [0, 0, 1, 0, 0, 1, 1, 0];
      result = bitsToInt(bits);
      expect(result, 38);

      bits = [0, 0, 0, 0, 0, 0, 0, 0];
      result = bitsToInt(bits);
      expect(result, 0);

      bits = [1, 1, 1, 1, 1, 1, 1, 1];
      result = bitsToInt(bits);
      expect(result, 255);
    });

    test('Returns zero for an empty list', () {
      final List<int> bits = [];
      final int result = bitsToInt(bits);
      expect(result, 0);
    });

    test('Converts a single bit to its corresponding integer value', () {
      List<int> bits = [1];
      int result = bitsToInt(bits);
      expect(result, 1);

      bits = [0];
      result = bitsToInt(bits);
      expect(result, 0);
    });
  });

  group("getRandom8BitNumber()", () {
    test('returns value within range', () async {
      final randomValue = await getRandom8BitNumber();
      expect(randomValue, isA<int>());
      expect(randomValue, greaterThanOrEqualTo(0));
      expect(randomValue, lessThanOrEqualTo(255));
    });

    test('returns an integer', () async {
      final randomValue = await getRandom8BitNumber();
      expect(randomValue, isA<int>());
    });

    test('generates 8 random bits', () async {
      final randomValue = await getRandom8BitNumber();
      final bitsList = intToBits(randomValue);
      expect(bitsList.length, equals(8));
    });

    test('generates valid bits', () async {
      final randomValue = await getRandom8BitNumber();
      final bitsList = intToBits(randomValue);
      for (final bit in bitsList) {
        expect(bit, isIn([0, 1]));
      }
    });
  });

  group("getRandomColor()", () {
    test('Test color generation', () async {
      // Call the getRandomColor() function
      final color = await getRandomColor();
      // Verify that the returned color is not null
      expect(color, isNotNull);
      // Verify that the red, green, and blue components are between 0 and 255
      expect(color.red, inInclusiveRange(0, 255));
      expect(color.green, inInclusiveRange(0, 255));
      expect(color.blue, inInclusiveRange(0, 255));
      // Verify that the alpha component is 255 (fully opaque)
      expect(color.alpha, 255);
    });
  });
}
