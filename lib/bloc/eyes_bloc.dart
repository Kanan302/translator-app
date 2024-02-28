import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'eyes_event.dart';
part 'eyes_state.dart';

class EyesBloc extends Bloc<EyesEvent, EyesState> {
  EyesBloc() : super(EyesInitial()) {
    on<EyesVisibility>((event, emit) {
      bool visibility = true;
      if (state is EyesLoading) {
        visibility = (state as EyesLoading).selected;
      }
      emit(EyesLoading(selected: !visibility));
    });
    on<ConfirmVisibility>((event, emit) {
      bool visibility = true;
      if (state is ConfirmEyesLoading) {
        visibility = (state as ConfirmEyesLoading).selected;
      }
      emit(ConfirmEyesLoading(selected: !visibility));
    });
  }
}
