import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/image_bloc.dart';
import 'package:weather_app/bloc/text_bloc.dart';
import '../bloc/weather_bloc.dart';
import 'Widgets/shape.dart';
import 'Widgets/weather_text.dart';
import 'Widgets/table_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 1.2 * kToolbarHeight, 20, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Shape(3, -0.3, BoxShape.circle, Colors.indigo),
              Shape(-3, -0.3, BoxShape.circle, Colors.indigo),
              Shape(0, -1.2, BoxShape.rectangle, Colors.teal),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherFetchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is WeatherFetchSuccess) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WeatherText('⛳️  ${state.weather.areaName}', 16, FontWeight.w300),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocProvider(
                              create: (context) => TextBloc()..add(GetTextEvent(state.weather.date!)),
                              child: BlocBuilder<TextBloc, TextState>(
                                builder: (context, textState) {
                                  if (textState is GetTextState) {
                                    return WeatherText(textState.text, 35, FontWeight.bold);
                                  }
                                  return WeatherText("Good Morning", 25, FontWeight.bold);
                                },
                              ),
                            ),
                            BlocProvider(
                              create: (context) => ImageBloc()..add(ChooseImage(state.weather.weatherConditionCode!)),
                              child: BlocBuilder<ImageBloc, ImageState>(
                                builder: (context, imageState) {
                                  if (imageState is ImageGet) {
                                    return Image.asset(imageState.imageName);
                                  }
                                  return Image.asset('assets/1.png');
                                },
                              ),
                            ),
                            Center(
                              child: WeatherText('${state.weather.temperature!.celsius!.round()} ºC', 35, FontWeight.bold),
                            ),
                            Center(
                              child:
                              WeatherText(state.weather.weatherDescription!.toUpperCase(), 20, FontWeight.bold),
                            ),
                            Center(
                              child: WeatherText(
                                  DateFormat('EEEE dd •').add_jm().format(state.weather.date!), 16, FontWeight.w300),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TableItem('assets/11.png', 'Sunrise', DateFormat().add_jm().format(state.weather.sunrise!)),
                                TableItem('assets/12.png', 'Sunset', DateFormat().add_jm().format(state.weather.sunset!)),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TableItem('assets/13.png', 'Max Temp', '${state.weather.tempMax!.celsius!.round()} ºC'),
                                TableItem('assets/14.png', 'Min Temp', '${state.weather.tempMin!.celsius!.round()} ºC'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }  else if (state is WeatherFetchFailure) {
                    return Center(
                      child: WeatherText(state.error, 25, FontWeight.bold),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
