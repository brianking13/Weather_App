import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/services/icons.dart';
//https://stackoverflow.com/questions/49402837/flutter-overlay-card-widget-on-a-container

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  double _width = 0.0;
  double _height = 0.0;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          getOverlayWidget(),
          // The containers in the background and scrollable
          getScrollableBody(),

        ],
      ),
    );
  }

  Widget getOverlayWidget() {
    return new Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.blueGrey[900],
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(

                      // change location
                      child: FlatButton.icon(
                        onPressed: ()async {
                          dynamic  result = await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'location': result['location'],
                              'current': result['current'],
                              'temps' : result['temps'],
                              'high' : result['high'],
                              'graphic' : result['graphic'],
                              'conditions' :result['conditions'],
                              'time' : result['time'],
                              'city' :result['city'],
                              'min5' : result['min5'],
                              'max5' : result['max5'],
                              'conditions5' : result['conditions5'],
                              'days' : result['days'],
                              'isDayCurrent' : result['isDayCurrent'],
                              'currentCondition': result['currentCondition'],
                              'isDay12' : result['isDay12'],
                            };
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)
                        ),
                        highlightColor: Colors.blueGrey[700],
                        label:Text(
                          data['city'] ,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ) ,
                        icon: Icon(Icons.location_on, color: Colors.white, size: 20.0),
                      ),



                    )
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(40,35,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        data['current'].toString(), // this is where temperature will go
                        style: TextStyle(fontSize: 80, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,5.0,0,0),
                      child: Container(
                          child: Text('°F', style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,0,0),
                      child: Container(
                          child:
//                          Image.asset(data['graphic'], scale: 1.8,) //TODO: replace with actual conditions
                      weatherIcon(90.0, data['currentCondition'], data['isDayCurrent']),
                      ),
                    )
                  ],
                ),
              ),// choose_location widget
              SizedBox(height: 90.0,),
              BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
//                  maxY:  data['current'] - 3.0,   // TODO: make the 12 hour high
                maxY: data['high'],
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      tooltipPadding: const EdgeInsets.all(0),
                      tooltipBottomMargin: 8,
                      getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                          ) {
                        return BarTooltipItem(
                          rod.y.round().toString(),
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: TextStyle(
                          color: Colors.grey[400], fontWeight: FontWeight.bold, fontSize: 14),
                      margin: 25,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return data['time'][0];
                          case 1:
                            return data['time'][1];
                          case 2:
                            return data['time'][2];
                          case 3:
                            return data['time'][3];
                          case 4:
                            return data['time'][4];
                          case 5:
                            return data['time'][5];
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(showTitles: false),
                  ),
                  borderData: FlBorderData(
                      show: false,
                      border: Border.all(color: Colors.white)
                  ),
                  barGroups: [
                    BarChartGroupData(
                        x: 0,
                        barRods: [BarChartRodData(y: data['temps'][0].toDouble(), color: Colors.lightBlueAccent, width: 20)],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 1,
                        barRods: [BarChartRodData(y: data['temps'][1].toDouble(), color: Colors.lightBlueAccent, width: 20)],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 2,
                        barRods: [BarChartRodData(y: data['temps'][2].toDouble(), color: Colors.lightBlueAccent, width: 20)],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(y: data['temps'][3].toDouble(), color: Colors.lightBlueAccent, width: 20)],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        barRods: [BarChartRodData(y: data['temps'][4].toDouble(), color: Colors.lightBlueAccent, width: 20)], x: 3,

                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(y: data['temps'][5].toDouble(), color: Colors.lightBlueAccent, width: 20)],
                        showingTooltipIndicators: [0]),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  weatherIcon(25.0, data['conditions'][0], data['isDay12'][0]),
                  SizedBox(width: 16,),
                  weatherIcon(25.0, data['conditions'][1], data['isDay12'][1]),
                  SizedBox(width: 16,),
                  weatherIcon(25.0, data['conditions'][2], data['isDay12'][2]),
                  SizedBox(width: 16,),
                  weatherIcon(25.0, data['conditions'][3],  data['isDay12'][3]),
                  SizedBox(width: 16,),
                  weatherIcon(25.0, data['conditions'][4],  data['isDay12'][4]),
                  SizedBox(width: 16,),
                  weatherIcon(25.0, data['conditions'][5],  data['isDay12'][5]),
                ],
              ),





            ],

          ),
        ),
      ),
    );
  }


  Widget getScrollableBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 93, 0, 0),
      child: SingleChildScrollView(

        physics: PageScrollPhysics(),
        child: new Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 645, 0, 0),
            ),
            new Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.lightBlueAccent,
                  elevation: 3,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 13,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.keyboard_arrow_up, color: Colors.blueGrey[900],),
                          SizedBox(width: 90,),
                          Text('5 Day Forecast',
                            style: TextStyle(fontSize: 15, color: Colors.blueGrey[900], fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 90,),
                          Icon(Icons.keyboard_arrow_up, color: Colors.blueGrey[900],),
                        ],
                      ),
                      SizedBox(height: 50,),
                      hourlyCards(0),
                      SizedBox(height: 50,),
                      hourlyCards(1),
                      SizedBox(height: 50,),
                      hourlyCards(2),
                      SizedBox(height: 50,),
                      hourlyCards(3),
                      SizedBox(height: 50,),
                      hourlyCards(4),
                    ],
                  ),
                ),
              ),
              height: _height * .8,
              color: Colors.blueGrey[900].withOpacity(0),
            ),
            new Container(
              height: _height * .04,
              color: Colors.blueGrey[900].withOpacity(0),
            ),
          ],
        ),
      ),
    );
  }


  Widget hourlyCards(i){
    double w = 5;
    double f = 20;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
      child: Row(
        children: <Widget>[
          Container(width: 60, child: Text(data['days'][i], style: TextStyle(color: Colors.blueGrey[900], fontSize: f, fontWeight: FontWeight.bold),)),
          Row(
            children: <Widget>[
              Text('Low: ', style: TextStyle(fontSize: f, color: Colors.blueGrey[900]),),
              SizedBox(width: w,),
              Text(data['min5'][i].toString(), style: TextStyle(fontSize: f, color: Colors.blueGrey[900]),),
              SizedBox(width: 20,),
              Text('High: ', style: TextStyle(fontSize: f, color: Colors.blueGrey[900]),),
              SizedBox(width: w,),
              Text(data['max5'][i].toString(), style: TextStyle(fontSize: f, color: Colors.blueGrey[900]),),
              SizedBox(width: 25,),
              weatherIcon(30.0, data['conditions5'][i], true),
//              weatherIcon(30.0, 'cloudy', true), // TODO: fix with real data


            ],
          ),
        ],
      ),
    );
  }

}


