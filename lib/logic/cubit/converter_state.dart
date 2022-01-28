part of 'converter_cubit.dart';

class ConverterState extends Equatable {
  String? outputStringNumber;
  bool britishCounting;
  bool visible;

  ConverterState(
      {this.outputStringNumber,
      required this.britishCounting,
      required this.visible});

  @override
  List<Object?> get props => [outputStringNumber, britishCounting, visible];
}
