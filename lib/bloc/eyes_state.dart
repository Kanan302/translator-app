part of 'eyes_bloc.dart';

sealed class EyesState extends Equatable {
  const EyesState();

  @override
  List<Object> get props => [];
}

final class EyesInitial extends EyesState {}

class EyesLoading extends EyesState {
  final bool selected;
  const EyesLoading({required this.selected});

  @override
  List<Object> get props => [selected];
}

class ConfirmEyesLoading extends EyesState {
  final bool selected;
  const ConfirmEyesLoading({required this.selected});

  @override
  List<Object> get props => [selected];
}
