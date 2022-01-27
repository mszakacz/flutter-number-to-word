part of 'converter_cubit.dart';

class ConverterState extends Equatable {
  String? outputStringNumber;

  ConverterState({this.outputStringNumber});

  @override
  List<Object?> get props => [outputStringNumber];
}
