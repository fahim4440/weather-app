import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/repositories.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<ChooseImage>((event, emit) {
      String imageName = Repositories().getImageName(event.imageCode);
      emit(ImageGet(imageName));
    });
  }
}
