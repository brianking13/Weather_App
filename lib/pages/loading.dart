import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWeather() async {
      Weather instance = Weather(location: '341363', city: 'Snohomish'); // TODO: make dynamic
      await Future.delayed(Duration(seconds: 2));
      await instance.getWeather();
//      print(instance.text);
      Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
        'current': instance.hourlyTemp,
        'temps' : instance.forecast12,
        'high' : instance.high,
        'conditions' : instance.conditions,
        'time' : instance.hours,
        'city' : instance.city,
        'min5' : instance.min5,
        'max5' : instance.max5,
        'conditions5' : instance.conditions5,
        'days' : instance.days,
        'isDayCurrent': instance.isDayCurrent,
        'isDay12': instance.isDay12,
        'currentCondition' : instance.currentCondition,

      });

}

  @override

  void initState() {
    super.initState();
    setupWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[900],
        child: Center(
          child: SpinKitPulse(
        color: Colors.grey[400],
          size: 100.0,
        ),
        ),

      ),
    );
  }
}


