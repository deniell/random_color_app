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

  group("getRandomBit()", () {
    test('should return either 0 or 1', () {
      final bit = getRandomBit();
      expect(bit, isIn([0, 1]));
    });

    test('should return an integer value', () {
      final bit = getRandomBit();
      expect(bit, isA<int>());
    });

    test('from 4 randomly generated bits at leas one should be different', () {
      final bit1 = getRandomBit();
      final bit2 = getRandomBit();
      final bit3 = getRandomBit();
      final bit4 = getRandomBit();
      print('bits: $bit1, $bit2, $bit3, $bit4');
      expect((bit1 != bit2) | (bit1 != bit3) | (bit2 != bit3) | (bit1 != bit4) |
        (bit2 != bit4) | (bit3 != bit4) , true,);
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
    test('returns value within range', () {
      final randomValue = getRandom8BitNumber();
      expect(randomValue, isA<int>());
      expect(randomValue, greaterThanOrEqualTo(0));
      expect(randomValue, lessThanOrEqualTo(255));
    });

    test('returns an integer', () {
      final randomValue = getRandom8BitNumber();
      expect(randomValue, isA<int>());
    });

    test('generates 8 random bits', () {
      final randomValue = getRandom8BitNumber();
      final bitsList = intToBits(randomValue);
      expect(bitsList.length, equals(8));
    });

    test('generates valid bits', () {
      final randomValue = getRandom8BitNumber();
      final bitsList = intToBits(randomValue);
      for (final bit in bitsList) {
        expect(bit, isIn([0, 1]));
      }
    });
  });

  group("getRandomColor()", () {
    test('Test color generation', () {
      // Call the getRandomColor() function
      final color = getRandomColor();
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
