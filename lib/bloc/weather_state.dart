part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

final class WeatherFetchLoading extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class WeatherFetchFailure extends WeatherState {
  final String error;
  const WeatherFetchFailure(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

final class WeatherFetchSuccess extends WeatherState {
  final Weather weather;

  const WeatherFetchSuccess(this.weather);

  @override
  // TODO: implement props
  List<Object?> get props => [weather];
}
