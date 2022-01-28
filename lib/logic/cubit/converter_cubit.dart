import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_number_to_word/logic/converter.dart';

part 'converter_state.dart';

class ConverterCubit extends Cubit<ConverterState> {
  ConverterCubit()
      : super(const ConverterState(
            outputStringNumber: ' ', britishCounting: false, visible: false));

  void switchBritish(bool value) => emit(
        ConverterState(
            outputStringNumber: state.outputStringNumber,
            britishCounting: value,
            visible: state.visible),
      );

  void convert(String? inputString) {
    bool visible = true;
    String outputString;
    if (inputString == null || inputString.isEmpty) {
      outputString = '';
      visible = false;
    } else {
      int value = int.parse(
        inputString.toString(),
      );
      outputString = toWord(value, state.britishCounting);
    }

    emit(
      ConverterState(
          britishCounting: state.britishCounting,
          outputStringNumber: outputString,
          visible: visible),
    );
  }
}
