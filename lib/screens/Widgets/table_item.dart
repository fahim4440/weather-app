import 'package:flutter/material.dart';
import 'weather_text.dart';

Row TableItem(String imageName, String text, String time) {
  return Row(
    children: [
      Image.asset(imageName, scale: 8,),
      const SizedBox(width: 5,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WeatherText(text, 16, FontWeight.w300),
          const SizedBox(height: 3,),
          WeatherText(time, 16, FontWeight.w600),
        ],
      ),
    ],
  );
}