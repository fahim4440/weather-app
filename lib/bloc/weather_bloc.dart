import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      // TODO: implement event handler
      emit(WeatherFetchLoading());
      try {
        WeatherFactory weatherFactory = WeatherFactory('995f6555b6c92017add201f4aa6dd203', language: Language.ENGLISH);
        Weather weather = await weatherFactory.currentWeatherByLocation(event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherFetchSuccess(weather));
      } catch(e) {
        print(e.toString());
        emit(WeatherFetchFailure(e.toString()));
      }
    });
  }
}
