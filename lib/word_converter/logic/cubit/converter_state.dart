part of 'converter_cubit.dart';

class ConverterState extends Equatable {
  final int? value;
  final String outputStringNumber;
  final bool britishCounting;
  final bool visible;

  const ConverterState({
    required this.value,
    required this.outputStringNumber,
    required this.britishCounting,
    required this.visible,
  });

  @override
  List<Object?> get props => [
        value,
        outputStringNumber,
        britishCounting,
        visible,
      ];
}
