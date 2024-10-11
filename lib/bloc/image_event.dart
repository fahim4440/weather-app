part of 'image_bloc.dart';

sealed class ImageEvent extends Equatable {
  const ImageEvent();
}

class ChooseImage extends ImageEvent {
  final int imageCode;

  const ChooseImage(this.imageCode);
  @override
  // TODO: implement props
  List<Object?> get props => [imageCode];
}
