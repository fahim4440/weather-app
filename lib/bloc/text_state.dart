part of 'text_bloc.dart';

sealed class TextState extends Equatable {
  const TextState();
}

final class TextInitial extends TextState {
  @override
  List<Object> get props => [];
}

final class GetTextState extends TextState {
  String text;

  GetTextState(this.text);

  @override
  // TODO: implement props
  List<Object?> get props => [text];
}
