import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_event.dart';
part 'text_state.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextInitial()) {
    on<GetTextEvent>((event, emit) {
      // TODO: implement event handler
      if (event.time.hour >= 6 && event.time.hour < 10) {
        emit(GetTextState('Good Morning'));
      } else if (event.time.hour >= 10 && event.time.hour < 16) {
        emit(GetTextState('Good Noon'));
      } else if (event.time.hour >= 16 && event.time.hour < 19) {
        emit(GetTextState('Good Afternoon'));
      } else if (event.time.hour >= 19 && event.time.hour < 24 || event.time.hour >= 0 && event.time.hour < 6) {
        emit(GetTextState('Good Night'));
      }
    });
  }
}
