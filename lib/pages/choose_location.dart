import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather_service.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<Weather> locations = [
    Weather(location: '341363', city: 'Snohomish'),
    Weather(location: '328766', city: 'Peoria'),
    Weather(location: '326703', city: 'Tuscaloosa'),
    Weather(location: '50337', city: 'Moose Jaw'),
    Weather(location: '350473', city: 'Portland'),
    Weather(location: '347810', city: 'Denver'),
    Weather(location: '346936', city: 'Tucson'),
    Weather(location: '348181', city: 'Atlanta'),
  ];

  void updateWeather(index) async{
    Weather instance = locations[index];
    await instance.getWeather();
    // navigate to homescreen
    Navigator.pop(context, {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
    appBar: AppBar(
      backgroundColor: Colors.blueGrey[900],
      elevation: 0,
      title: Text('Locations', style: TextStyle(fontSize: 25),),
      centerTitle: true,
    ),
      body:
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,30,30),
                  child: InkWell(
                    onTap: () {updateWeather(index);},
                      borderRadius:BorderRadius.circular(20),
                      child: Container(
                      padding: EdgeInsets.all(12.0),
                            child: Row(
                                    children: <Widget>[
                                SizedBox(width: 40,),
                                Icon(Icons.cloud, color: Colors.lightBlueAccent,),
                                SizedBox(width: 20,),
                                Text(
                                  locations[index].city,
                                  style: TextStyle(color: Colors.white, fontSize: 23),
                      ),]),
                      )
                  ),
                );
              }),
        )

    );
  }
}
