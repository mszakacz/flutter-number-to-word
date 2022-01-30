import 'package:flutter_number_to_word/word_converter/logic/cubit/converter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  int? value = 1234;
  String outputStringNumber = '1234';
  bool britishCounting = false;
  bool visible = true;

  group('ConverterState', () {
    test('supports value comparisons', () {
      expect(
        ConverterState(
          value: value,
          outputStringNumber: outputStringNumber,
          britishCounting: britishCounting,
          visible: visible,
        ),
        ConverterState(
          value: value,
          outputStringNumber: outputStringNumber,
          britishCounting: britishCounting,
          visible: visible,
        ),
      );
    });
  });
}
