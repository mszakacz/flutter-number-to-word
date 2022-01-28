part of 'converter_cubit.dart';

class ConverterState extends Equatable {
  final String outputStringNumber;
  final bool britishCounting;
  final bool visible;

  const ConverterState({
    required this.outputStringNumber,
    required this.britishCounting,
    required this.visible,
  });

  @override
  List<Object?> get props => [outputStringNumber, britishCounting, visible];
}
