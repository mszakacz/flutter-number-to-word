import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_number_to_word/word_converter/logic/converter.dart';

part 'converter_state.dart';

class ConverterCubit extends Cubit<ConverterState> {
  ConverterCubit()
      : super(
          const ConverterState(
            value: null,
            outputStringNumber: ' ',
            britishCounting: false,
            visible: false,
          ),
        );

  void switchBritish(bool british) => emit(
        ConverterState(
            value: state.value,
            outputStringNumber: toWord(
              state.value!,
              british,
            ),
            britishCounting: british,
            visible: state.visible),
      );

  void convert(String? inputString) {
    bool visible = true;
    int? value;
    String outputString;
    if (inputString == null || inputString.isEmpty) {
      outputString = '';
      visible = false;
    } else {
      value = int.parse(
        inputString.toString(),
      );
      outputString = toWord(value, state.britishCounting);
    }

    emit(
      ConverterState(
          value: value,
          britishCounting: state.britishCounting,
          outputStringNumber: outputString,
          visible: visible),
    );
  }
}
