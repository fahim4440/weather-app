part of 'text_bloc.dart';

sealed class TextEvent extends Equatable {
  const TextEvent();
}

class GetTextEvent extends TextEvent {
  DateTime time;

  GetTextEvent(this.time);

  @override
  // TODO: implement props
  List<Object?> get props => [time];

}
