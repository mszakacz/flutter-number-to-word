import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_number_to_word/word_converter/logic/cubit/converter_cubit.dart';
import 'package:test/test.dart';
import 'package:equatable/equatable.dart';

void main() {
  group('ConverterCubit', () {
    late ConverterCubit converterCubit;

    setUp(() {
      converterCubit = ConverterCubit();
    });

    tearDown(() {
      converterCubit.close();
    });

    test('initial state', () {
      expect(
        converterCubit.state,
        const ConverterState(
          value: null,
          outputStringNumber: ' ',
          britishCounting: false,
          visible: false,
        ),
      );
    });

    blocTest<ConverterCubit, ConverterState>(
      'emits output for 7',
      build: () => converterCubit,
      act: (cubit) => cubit.convert('7'),
      expect: () => [
        const ConverterState(
          value: 7,
          outputStringNumber: 'seven',
          britishCounting: false,
          visible: true,
        ),
      ],
    );

    blocTest<ConverterCubit, ConverterState>(
      'emits output for 42',
      build: () => converterCubit,
      act: (cubit) => cubit.convert('42'),
      expect: () => [
        const ConverterState(
          value: 42,
          outputStringNumber: 'forty-two',
          britishCounting: false,
          visible: true,
        ),
      ],
    );

    blocTest<ConverterCubit, ConverterState>(
      'emits output for 1999',
      build: () => converterCubit,
      act: (cubit) => cubit.convert('1999'),
      expect: () => [
        const ConverterState(
          value: 1999,
          outputStringNumber: 'one thousand nine hundred and ninety-nine',
          britishCounting: false,
          visible: true,
        ),
      ],
    );

    blocTest<ConverterCubit, ConverterState>(
      'emits output for British 1999',
      build: () => converterCubit,
      act: (cubit) => {
        cubit.convert('1999'),
        cubit.switchBritish(true),
      },
      expect: () => [
        const ConverterState(
          value: 1999,
          outputStringNumber: 'one thousand nine hundred and ninety-nine',
          britishCounting: false,
          visible: true,
        ),
        const ConverterState(
          value: 1999,
          outputStringNumber: 'nineteen hundred and ninety-nine',
          britishCounting: true,
          visible: true,
        ),
      ],
    );

    blocTest<ConverterCubit, ConverterState>(
      'emits output for 2001',
      build: () => converterCubit,
      act: (cubit) => cubit.convert('2001'),
      expect: () => [
        const ConverterState(
          value: 2001,
          outputStringNumber: 'two thousand and one',
          britishCounting: false,
          visible: true,
        ),
      ],
    );

    blocTest<ConverterCubit, ConverterState>(
      'emits output for 17999',
      build: () => converterCubit,
      act: (cubit) => cubit.convert('17999'),
      expect: () => [
        const ConverterState(
          value: 17999,
          outputStringNumber: 'seventeen thousand nine hundred and ninety-nine',
          britishCounting: false,
          visible: true,
        ),
      ],
    );

    blocTest<ConverterCubit, ConverterState>(
      'emits output for 342251',
      build: () => converterCubit,
      act: (cubit) => cubit.convert('342251'),
      expect: () => [
        const ConverterState(
          value: 342251,
          outputStringNumber:
              'three hundred and forty-two thousand two hundred and fifty-one',
          britishCounting: false,
          visible: true,
        ),
      ],
    );

    blocTest<ConverterCubit, ConverterState>(
      'emits output for 1300420',
      build: () => converterCubit,
      act: (cubit) => cubit.convert('1300420'),
      expect: () => [
        const ConverterState(
          value: 1300420,
          outputStringNumber:
              'one million three hundred thousand four hundred and twenty',
          britishCounting: false,
          visible: true,
        ),
      ],
    );

    blocTest<ConverterCubit, ConverterState>(
      'emits output for 1234 and switch to British',
      build: () => converterCubit,
      act: (cubit) => {
        cubit.convert('1234'),
        cubit.switchBritish(true),
      },
      expect: () => [
        const ConverterState(
          value: 1234,
          outputStringNumber: 'one thousand two hundred and thirty-four',
          britishCounting: false,
          visible: true,
        ),
        const ConverterState(
          value: 1234,
          outputStringNumber: 'twelve hundred and thirty-four',
          britishCounting: true,
          visible: true,
        ),
      ],
    );
  });
}
