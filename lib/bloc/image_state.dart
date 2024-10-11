part of 'image_bloc.dart';

sealed class ImageState extends Equatable {
  const ImageState();
}

final class ImageInitial extends ImageState {
  @override
  List<Object> get props => [];
}

final class ImageGet extends ImageState {
  final String imageName;
  const ImageGet(this.imageName);

  @override
  // TODO: implement props
  List<Object?> get props => [imageName];

}
