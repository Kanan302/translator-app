part of 'eyes_bloc.dart';

sealed class EyesEvent extends Equatable {
  const EyesEvent();

  @override
  List<Object> get props => [];
}

class EyesVisibility extends EyesEvent {}

class ConfirmVisibility extends EyesEvent {}