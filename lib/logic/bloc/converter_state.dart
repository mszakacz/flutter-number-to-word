part of 'converter_bloc.dart';

abstract class ConverterState extends Equatable {
  const ConverterState();
  
  @override
  List<Object> get props => [];
}

class ConverterInitial extends ConverterState {}
