part of 'converter_cubit.dart';

class ConverterState extends Equatable {
  String? outputStringNumber;
  bool britishCounting;

  ConverterState({this.outputStringNumber, required this.britishCounting});

  @override
  List<Object?> get props => [outputStringNumber, britishCounting];
}
