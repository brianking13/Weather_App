import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

Widget weatherIcon(size, current, daytime) {
  if (current == 'Sunny') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_sunny, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_clear, color: Colors.white, size: size,);
    }
    //done
  }
  if (current == 'Mostly sunny') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_sunny_overcast, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.day_sunny_overcast, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Partly sunny') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_cloudy, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_cloudy, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Intermittent clouds') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_sunny_overcast, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_cloudy, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Hazy sunshine') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_haze, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.day_haze, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Mostly cloudy') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.cloudy, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.cloudy, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'cloudy') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.cloudy, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.cloudy, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Dreary (overcast)') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.cloudy, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.cloudy, color: Colors.white, size: size,);
    }
  }
  if (current == 'Fog') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.fog, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_fog, color: Colors.white, size: size,);
    }
  }
  if (current == 'Showers') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_showers, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_showers, color: Colors.white, size: size,);
    }
  }
  if (current == 'Mostly cloudy w/ showers') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.showers, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.showers, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Partly sunny w/ showers') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_showers, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_showers, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'T-storms') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.thunderstorm, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.thunderstorm, color: Colors.white, size: size,);
    }
  }
  if (current == 'Mostly cloudy w/ t-Storms') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.thunderstorm, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.thunderstorm, color: Colors.white, size: size,);
    }
  }
  if (current == 'Partly sunny w/ t-Storms') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_thunderstorm, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_thunderstorm, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Rain') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.rain, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.rain, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Flurries') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_snow, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_snow, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Mostly cloudy w/ flurries') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.snow, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.snow, color: Colors.white, size: size,);
    }
  }
  if (current == 'Partly sunny w/ flurries') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_snow, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_snow, color: Colors.white, size: size,);
    }
  }
  if (current == 'Snow') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.snow, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.snow, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Mostly cloudy w/ snow') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.snow, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.snow, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Ice') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.snowflake_cold, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.snowflake_cold, color: Colors.white, size: size,);
    }
  }
  if (current == 'Sleet') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.sleet, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.sleet, color: Colors.white, size: size,);
    }
  }
  if (current == 'Freezing rain') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.snowflake_cold, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.snowflake_cold, color: Colors.white, size: size,);
    }
  }
  if (current == 'Rain and snow') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_snow, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_snow, color: Colors.white, size: size,);
    }
  }
  if (current == 'Hot') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.hot, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.hot, color: Colors.white, size: size,);
    }
  }
  if (current == 'Cold') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.snowflake_cold, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.snowflake_cold, color: Colors.white, size: size,);
    }
  }
  //done
  if (current == 'Windy') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_windy, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_cloudy_windy, color: Colors.white, size: size,);
    }
  }
  if (current == 'Clear') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_sunny, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_clear, color: Colors.white, size: size,);
    }
  }
  if (current == 'Mostly clear') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_sunny_overcast, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_cloudy, color: Colors.white, size: size,);
    }
  }
  if (current == 'Partly cloudy') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_sunny_overcast, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_cloudy, color: Colors.white, size: size,);
    }
  }
  if (current == 'Hazy moonlight') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_haze, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_partly_cloudy, color: Colors.white, size: size,);
    }
  }
  if (current == 'Partly cloudy w/ showers') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_showers, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_showers, color: Colors.white, size: size,);
    }
  }
  if (current == 'Partly cloudy w/ t-Storms') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_thunderstorm, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_alt_thunderstorm, color: Colors.white, size: size,);
    }
  }
  if (current == 'Mostly cloudy w/ snow') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.day_snow, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.night_snow, color: Colors.white, size: size,);
    }
  }
  if (current == 'Aliens') {
    if (daytime == true) {
      return BoxedIcon(WeatherIcons.alien, color: Colors.white, size: size,);
    }
    else {
      return BoxedIcon(WeatherIcons.alien, color: Colors.white, size: size,);
    }
  }


  else {return BoxedIcon(WeatherIcons.cloud, color: Colors.white, size: size,);}
}