import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'bloc/weather_bloc.dart';
import 'screens/homescreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Repositories repositories = Repositories();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: repositories.determinePosition(),
        builder: (context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc()..add(FetchWeather(snapshot.data as Position)),
              child: const HomeScreen(),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        })
    );
  }
}
