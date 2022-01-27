import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_number_to_word/logic/converter.dart';

part 'converter_state.dart';

class ConverterCubit extends Cubit<ConverterState> {
  ConverterCubit() : super(ConverterState(outputStringNumber: ' '));

  void convert(String? inputString) => emit(ConverterState(
      outputStringNumber: toWord(int.parse(inputString.toString()))));

  // void convert(String? inputString) {
  //   int value = int.parse(inputString.toString());
  //   String outputString = toWord(value);

  //   emit(ConverterState(
  //       inputStringNumber: inputString,
  //       value: value,
  //       outputStringNumber: outputString));
  //   print('input: $inputString, state: ${state.value.toString()}');
  // }
}
