import 'dart:convert';
import 'package:http/http.dart';
import 'dart:math';
import 'package:intl/intl.dart';


// using AccuWeather API (API Key: LxQ57oiYCVeqDNYNpMOpSiEynYzZB6UF )
// Hourly: http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/341363?apikey=LxQ57oiYCVeqDNYNpMOpSiEynYzZB6UF%20
// current http://dataservice.accuweather.com/currentconditions/v1/341363?apikey=LxQ57oiYCVeqDNYNpMOpSiEynYzZB6UF
// 5Day: http://dataservice.accuweather.com/forecasts/v1/daily/5day/341363?apikey=%20LxQ57oiYCVeqDNYNpMOpSiEynYzZB6UF
// location key for Snohomish: 341363




class Weather {
  String location;
  String city;
  String mainURL = 'http://dataservice.accuweather.com/';
  String apiKey = 'LxQ57oiYCVeqDNYNpMOpSiEynYzZB6UF%20';
  int hourlyTemp;
  String currentCondition;
  List<String> conditions = [];
  List<DateTime> time = [];
  List hours = []; // times text e.g. [1am, 3am , 5am ...]
  List<DateTime> days5 = [];
  List days = []; // days e.g. [Mon, Tues, Wed... ]
  List offset = []; // utc offsets
  List datetime = []; // times for hourly (datetime format)
  List datedate = []; // days for 5 day forecast (datetime format)
  List forecast12 = []; // 12 hour forecast
  List min5 = []; // 5 day forecast mins
  List max5 = []; // 5 day forecast maxs
  List<String> conditions5 = []; // 5 day forecast conditions
  double high;
  bool isDayCurrent;  // gives current condition for weather graphic/icon
  List<bool> isDay12 = [];
  Weather({this.location, this.city});

  Future<void> getWeather() async {
    try { // request weather

      // request current weather
      Response responseCurrent = await get("$mainURL/currentconditions/v1/$location?apikey=$apiKey");
      Map dataCurrent = jsonDecode(responseCurrent.body.substring(1,responseCurrent.body.length-1));  // could have just used a List instead of Map, didn't need substring
//      print(dataCurrent['WeatherText']);
      hourlyTemp = dataCurrent['Temperature']['Imperial']['Value'].round();
      currentCondition = dataCurrent['WeatherText'];
      bool isDayCurrent = dataCurrent['IsDayTime'];


      // ---------------------- TESTING ----------------------------------------
//      hourlyTemp = 50; // TODO: remove, this is fake data
//      currentCondition = 'Cloudy'; // TODO: add all graphics
//      bool isDayCurrent = true;


      // -----------------------------------------------------------------------

      //request 12 hour forecast
      Response response12 = await get(
          '$mainURL/forecasts/v1/hourly/12hour/$location?apikey=$apiKey');
      List data12 = jsonDecode(response12.body);
      for (var i = 0; i <= 10; i += 2) {
        forecast12.add((data12[i]['Temperature']['Value']).toDouble());
        datetime.add(data12[i]['DateTime']);
        offset.add(data12[i]['DateTime'].substring(20,22));   // add to list of utc_offsets
          conditions.add(data12[i]['IconPhrase']);
          isDay12.add(data12[i]['IsDaylight']);
    };

      for (var i = 0; i <=5; i ++){
        time.add(DateTime.parse(datetime[i]));
        time[i]= time[i].subtract(Duration(hours: int.parse(offset[i]))); //this is to account for the utc_offset
        String hour = DateFormat.j().format(time[i]);
        hours.add(hour);    // this gives e.g. [1am, 3am, 5am, ... ]
      };
      print(isDay12);
      print(conditions);



      // ---------------------- TESTING ----------------------------------------
//        forecast12 = [50,51,61,63,64,63];// TODO: remove, this is fake data
//        isDay12 = [false,false,false,true,true,true];
//        hours = ['9am','11am','1pm','3pm','5pm','7pm'];
////        high = [12,15,16,17,15,11].reduce(max);
//        conditions = ['Intermittent clouds', 'Intermittent clouds', 'Intermittent clouds', 'Sunny', 'Partly cloudy', 'Sunny'];
//

      // -----------------------------------------------------------------------

      // 5 Day Forecast
      Response response5 = await get(
          '$mainURL/forecasts/v1/daily/5day/$location?apikey=$apiKey');
          Map data5 = jsonDecode(response5.body);
      for (var i = 0; i <= 4; i ++) {
        min5.add((data5['DailyForecasts'][i]['Temperature']['Minimum']['Value']).toInt());
        max5.add((data5['DailyForecasts'][i]['Temperature']['Maximum']['Value']).toInt());
//        conditions5.add((data5['DailyForecasts'][i]['Day']['IconPhrase']));
        datedate.add(data5['DailyForecasts'][i]['Date']);
        days5.add(DateTime.parse(datedate[i]));
        String day = DateFormat.E().format(days5[i]);
        days.add(day);
        conditions5.add(data5['DailyForecasts'][i]['Day']['IconPhrase']);
    };
        high = data5['DailyForecasts'][0]['Temperature']['Maximum']['Value'];
      //--------------------TESTING MAX & MIN ---------------------------------

//      min5 = [48,42,46,49,50];
//      max5 = [60,66,67,62,59];
//      conditions5 = ['Intermittent clouds', 'Intermittent clouds', 'Intermittent clouds', 'Aliens', 'Clear'];
//      days =  ['Sat', 'Sun', 'Mon', 'Tue', 'Wed'];
//      high = 62;



      //-----------------------------------------------------------------------


    }
    catch (e) {
      print('caught error: $e');
    }
  }




}


